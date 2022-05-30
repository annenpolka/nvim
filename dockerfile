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
  git \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Copy neovim files from neviom-base
COPY --from=neovim-base /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim-base /usr/local/share/nvim /usr/local/share/nvim

# add nonroot user
RUN useradd -m dev

# Copy entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# set startup working directory
WORKDIR /home/dev

CMD ["bash"]
