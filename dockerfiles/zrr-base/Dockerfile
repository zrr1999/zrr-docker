FROM ubuntu:latest as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV TERM xterm

# install apt-get packages
RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
RUN apt-get update \
&& apt-get install -y --no-install-recommends curl bsdmainutils yadm \
build-essential openssh-server ca-certificates language-pack-zh-hans \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# fix some errors
RUN localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8

# switch to zrr user
RUN useradd -r -g root zrr \
&& sed -i 's#zrr:x:999:0::/home/zrr:/bin/sh#zrr:x:0:0::/home/zrr:/bin/zsh#g' /etc/passwd
RUN ln -s /root /home/zrr
RUN echo "root:0000" | chpasswd
RUN echo "zrr:0000" | chpasswd
USER zrr

# install and config ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
RUN mkdir -p /home/zrr/.ssh
RUN ssh-keygen -t rsa -f /home/zrr/.ssh/id_rsa

# install some tools by yadm
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
RUN yadm clone --bootstrap https://github.com/zrr1999/dotfiles.git

# add some services
RUN echo "pueued -d" >> /run.sh
RUN echo "/etc/init.d/ssh start" >> /run.sh
RUN chmod +x /run.sh

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
