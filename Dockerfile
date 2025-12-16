# Use Debian Trixie (testing) for glibc 2.39 required by CRE
FROM debian:trixie-slim

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js v18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install Bun v1.3 or higher
RUN curl -fsSL https://bun.sh/install | bash
ENV BUN_INSTALL="/root/.bun"
ENV PATH="$BUN_INSTALL/bin:$PATH"

# Install CRE (Chainlink Runtime Environment)
RUN curl -sSL https://cre.chain.link/install.sh | bash
ENV PATH="/root/.cre/bin:$PATH"

# Install mdBook (optional but nice to have)
RUN curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.40/mdbook-v0.4.40-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C /usr/local/bin

# Create workspace directory
WORKDIR /workspace

# Keep container running
CMD ["/bin/bash"]
