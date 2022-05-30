FROM debian:unstable-slim AS neovim-base

RUN apt-get update && apt-get install -y \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++   \
  pkg-config \
  unzip \
  curl \
  doxygen \
  git

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git
ARG VERSION=master
RUN cd neovim && git checkout ${VERSION} && make CMAKE_BUILD_TYPE=RelWithDebInfo install

# working environment
FROM debian:unstable-slim

# dependencies
RUN apt-get update && apt-get install -y \
  curl \
  tar \
  git \
  wget \
  gzip \
  unzip \
  python3 \
  python3-pip \
  nodejs \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deno.land/install.sh | sh
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy neovim files from neovim-base
COPY --from=neovim-base /usr/local/lib/nvim /usr/local/lib/nvim
COPY --from=neovim-base /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim-base /usr/local/share/nvim /usr/local/share/nvim


# add nonroot user
RUN useradd -m dev

# work with nonroot user temporarily
USER dev

# copy neovim config
COPY --chown=dev:dev ./ /home/dev/.config/nvim
RUN rm -r /home/dev/.config/nvim/plugin

# bootstrap packer.nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# back to root
USER root

# Copy entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# set startup working directory
WORKDIR /home/dev

CMD ["bash"]
