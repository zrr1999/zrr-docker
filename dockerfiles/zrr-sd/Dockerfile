FROM zrr1999/zrr-base:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
&& apt-get install -y --no-install-recommends libgl1 libglib2.0-0 python3 python3-pip python-is-python3 python3-venv  \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /stable-diffusion && cd /stable-diffusion \
&& git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git \
&& cd stable-diffusion-webui \
&& sed -i 's/can_run_as_root=0/can_run_as_root=1/g' webui.sh \
&& export COMMANDLINE_ARGS="--skip-torch-cuda-test" \
&& bash webui.sh

RUN echo "export PATH=$PATH:/nvidia/cuda/bin" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/nvidia/cuda/lib" >> /etc/profile
RUN echo "export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/nvidia/cuda/include" >> /etc/profile
RUN echo "export NCCL_ROOT=/nvidia/cuda" >> /etc/profile
RUN echo "export CUDA_HOME=/nvidia/cuda" >> /etc/profile

WORKDIR "/workspace"
EXPOSE 22
EXPOSE 80
CMD /bin/bash -c "/run.sh && zsh"