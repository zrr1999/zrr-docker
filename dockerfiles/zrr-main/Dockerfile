FROM zrr1999/zrr-base:latest as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install apt-get packages
RUN apt-get update \
&& apt-get install -y --no-install-recommends ffmpeg \
# && apt-get install -y --no-install-recommends docker-ce-cli \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN brew install typst
RUN curl -fsSL https://get.docker.com/ | sh

WORKDIR "/workspace"
EXPOSE 22
CMD /bin/bash -c "/run.sh && zsh"
