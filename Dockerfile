ARG BASE_IMAGE=ubuntu:noble-20250127

FROM ${BASE_IMAGE}

ARG NVIM_TAR_GZ_URL=https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.tar.gz

RUN apt-get update

RUN apt-get install -y git make unzip gcc ripgrep yarnpkg locales luarocks curl tar xsel

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

RUN mkdir /opt/nvim/
RUN sh -c "curl -L ${NVIM_TAR_GZ_URL} | tar -zx --strip-components=1 --directory /opt/nvim"

