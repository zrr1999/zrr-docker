FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
&& apt-get install -y --no-install-recommends patchelf \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& brew install cmake ninja llvm gdb ccache \
&& brew install python@3.8 python@3.9 python@3.10 \
&& pip3.8 install --no-cache-dir protobuf==3.1.0 ninja numpy \
&& pip3.9 install --no-cache-dir protobuf==3.1.0 ninja numpy \
&& pip3.10 install --no-cache-dir protobuf==3.1.0 ninja numpy \
&& pip3.11 install --no-cache-dir protobuf==3.1.0 ninja numpy

RUN echo 'export PATH=$PATH:/nvidia/cuda/bin' >> /etc/profile
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/nvidia/cuda/lib64' >> /etc/profile
RUN echo 'export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/nvidia/cuda/include' >> /etc/profile
RUN echo 'export NCCL_ROOT=/nvidia/cuda' >> /etc/profile
RUN echo 'export CUDA_HOME=/nvidia/cuda' >> /etc/profile

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
