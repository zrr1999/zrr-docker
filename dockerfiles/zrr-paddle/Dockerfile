FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
&& apt-get install -y --no-install-recommends patchelf \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& brew install cmake ninja llvm gdb \
&& brew install python@3.8 python@3.9 python@3.10 \
&& pip3 install --no-cache-dir protobuf ninja

RUN echo "export PATH=$PATH:/nvidia/cuda/bin" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/nvidia/cuda/lib64" >> /etc/profile

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
