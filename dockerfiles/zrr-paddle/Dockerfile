FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
&& apt-get install -y --no-install-recommends patchelf python3 python3-pip python-is-python3 \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& brew install cmake ninja llvm gdb ccache \
&& brew install python@3.10 python@3.11 python@3.12 \
&& pip3.10 install --no-cache-dir protobuf==3.1.0 ninja numpy \
&& pip3.11 install --no-cache-dir protobuf==3.1.0 ninja numpy \
&& pip3.12 install --no-cache-dir protobuf==3.1.0 ninja numpy

ENV PATH="$PATH:/nvidia/cuda/bin"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/nvidia/cuda/lib"
ENV CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/nvidia/cuda/include"
ENV NCCL_ROOT="/nvidia/cuda"
ENV CUDA_HOME="/nvidia/cuda"

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
