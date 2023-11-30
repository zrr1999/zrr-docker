FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
&& apt-get install -y --no-install-recommends libgl1 libglib2.0-0 \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& brew install python@3.10

RUN mkdir /stable-diffusion && cd /stable-diffusion \
&& git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git \
&& cd stable-diffusion-webui \
&& export COMMANDLINE_ARGS="--skip-torch-cuda-test" \
&& export venv_dir="-" \
&& bash webui.sh -f

ENV PATH="$PATH:/nvidia/cuda/bin"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/nvidia/cuda/lib"
ENV CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/nvidia/cuda/include"
ENV NCCL_ROOT="/nvidia/cuda"
ENV CUDA_HOME="/nvidia/cuda"

WORKDIR "/workspace"
EXPOSE 22
EXPOSE 80
CMD /bin/bash -c "/run.sh && zsh"
