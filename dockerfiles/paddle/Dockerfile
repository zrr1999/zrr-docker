FROM paddlepaddle/paddle:latest-dev-cuda11.7-cudnn8.4-trt8.4-gcc8.2
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV TERM xterm

# install apt-get packages
RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
RUN apt-get update \
&& apt-get install -y --no-install-recommends zsh git curl bsdmainutils \
build-essential openssh-server ca-certificates language-pack-zh-hans \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# fix some errors
RUN localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8

# switch to zrr1999 user
RUN useradd -r -g root zrr1999 \
&& sed -i 's#zrr1999:x:999:0::/home/zrr1999:/bin/sh#zrr1999:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd \
&& sed -i 's#root:x:0:0:root:/root:/bin/bash#root:x:0:0::/home/zrr1999:/bin/zsh#g' /etc/passwd
RUN echo "root:0000" | chpasswd
RUN echo "zrr1999:0000" | chpasswd
USER zrr1999

# install brew
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN (echo; echo "eval '$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)'") >> /home/zrr1999/profile
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
RUN brew install lsd sd dust ripgrep fd hyperfine bottom procs
RUN brew install pueue fzf httpie progress atuin lua
RUN brew install helix git-delta gitui zellij difftastic
RUN brew install ast-grep

# add some services
RUN echo "pueued -d" >> /run.sh
RUN echo "/etc/init.d/ssh start" >> /run.sh
RUN chmod +x /run.sh

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
