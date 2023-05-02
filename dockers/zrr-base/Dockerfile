FROM ubuntu:latest

# install apt packages
RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list
RUN apt update
RUN apt install -y git curl tree build-essential
RUN apt install -y zsh
RUN apt install -y openssh-server

# switch to zrr1999 user
RUN useradd -r -g root zrr1999
RUN sed -i 's#zrr1999:x:999:0::/home/zrr1999:/bin/sh#zrr1999:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd
RUN sed -i 's#root:x:0:0:root:/root:/bin/bash#root:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd
RUN echo "root:0000" | chpasswd
RUN echo "zrr1999:0000" | chpasswd
USER zrr1999

# install brew 
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /etc/profile
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install and config zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN /home/linuxbrew/.linuxbrew/bin/brew install zplug
COPY config/.zshrc /home/zrr1999/.zshrc
COPY config/.p10k.zsh /home/zrr1999/.p10k.zsh

# install and config ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa
COPY run.sh /run.sh

# install gitui
RUN /home/linuxbrew/.linuxbrew/bin/brew install gitui

WORKDIR "/workspace"
EXPOSE 22
CMD ["/bin/zsh", "/run.sh"]
