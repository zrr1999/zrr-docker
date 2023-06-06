FROM ubuntu:latest as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install apt-get packages
RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git curl build-essential zsh openssh-server ripgrep fd-find
RUN apt-get install -y ca-certificates language-pack-zh-hans

# fix some errors
RUN localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8

# switch to zrr1999 user
RUN useradd -r -g root zrr1999
RUN sed -i 's#zrr1999:x:999:0::/home/zrr1999:/bin/sh#zrr1999:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd
RUN sed -i 's#root:x:0:0:root:/root:/bin/bash#root:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd
RUN echo "root:0000" | chpasswd
RUN echo "zrr1999:0000" | chpasswd
USER zrr1999

# install brew
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN (echo; echo "eval '$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)'") >> /etc/profile
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# install and config zsh
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.* /home/zrr1999/
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/z-shell/zi-src/main/lib/sh/install.sh)" -- -i skip \
&& /bin/zsh -cl -- '(source ~/.zi.zsh && @zi-scheduler burst) || true'

# install and config ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa

# install some tools
RUN brew install lsd hyperfine bottom procs sd dust pueue lua
RUN brew install git-delta gitui zellij
RUN brew install helix

# install python and related tools
RUN brew install python pdm

# add some services
RUN echo "pueued -d" >> /run.sh
RUN echo "/etc/init.d/ssh start" >> /run.sh

WORKDIR "/workspace"
EXPOSE 22
CMD ["zsh", "/run.sh && /bin/zsh"]
