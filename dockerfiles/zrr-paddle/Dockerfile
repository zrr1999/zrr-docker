FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN brew install cmake ninja llvm gdb \
&& brew install python@3.8 python@3.9 python@3.10

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
