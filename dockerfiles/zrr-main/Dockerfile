FROM zrr1999/zrr-base:latest as base

# install apt-get packages
RUN apt-get update \
&& apt-get install -y --no-install-recommends docker-ce-cli ffmpeg \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
