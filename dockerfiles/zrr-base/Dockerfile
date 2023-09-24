FROM ubuntu:22.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV TERM xterm
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# install apt-get packages
RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
RUN apt-get update \
&& apt-get install -y --no-install-recommends curl bsdmainutils yadm \
build-essential openssh-server ca-certificates language-pack-zh-hans \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# fix some errors
RUN localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8

# switch to zrr user and install some tools by yadm
RUN echo "root:0000" | chpasswd
RUN yadm clone --bootstrap https://github.com/zrr1999/dotfiles.git
USER zrr

# install and config ssh
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
RUN ssh-keygen -t rsa -f /home/zrr/.ssh/id_rsa
# RUN chmod -R 600 /etc/ssh/

# add some services
RUN echo "pueued -d" >> /run.sh
RUN echo "/etc/init.d/ssh start" >> /run.sh
RUN chmod +x /run.sh

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
