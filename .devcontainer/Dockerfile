# Use Ubuntu as base image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    bzip2 \
    git \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    software-properties-common \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    vim \
    nano \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash goose && \
    echo "goose:goose" | chpasswd && \
    adduser goose sudo && \
    echo "goose ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the goose user
USER goose
WORKDIR /home/goose

# Create .local/bin directory (where Goose CLI will be installed)
RUN mkdir -p /home/goose/.local/bin

# Add .local/bin to PATH
ENV PATH="/home/goose/.local/bin:${PATH}"

# Install Goose CLI using the official installation script
RUN curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash

# Create a workspace directory in the user's home
RUN mkdir -p /home/goose/workspace

# Set the working directory to workspace
WORKDIR /home/goose/workspace

# Add a script to help with initial setup
RUN echo '#!/bin/bash\n\
echo "=== Goose DevContainer Setup ==="\n\
echo "Goose CLI is installed and ready to use!"\n\
echo ""\n\
echo "To get started:"\n\
echo "  1. Configure your LLM provider: goose configure"\n\
echo "  2. Start a session: goose session"\n\
echo ""\n\
echo "Available commands:"\n\
echo "  goose --help       - Show help"\n\
echo "  goose configure    - Configure LLM provider"\n\
echo "  goose session      - Start a Goose session"\n\
echo "  goose update       - Update Goose to latest version"\n\
echo ""\n\
echo "Note: You will need to set up your LLM provider API key."\n\
echo "Example for OpenAI: export OPENAI_API_KEY=your_api_key_here"\n\
' > /home/goose/setup-info.sh && chmod +x /home/goose/setup-info.sh

# Create a .bashrc with helpful aliases and PATH
RUN echo 'export PATH="/home/goose/.local/bin:$PATH"' >> /home/goose/.bashrc && \
    echo 'alias ll="ls -la"' >> /home/goose/.bashrc && \
    echo 'alias goose-help="/home/goose/setup-info.sh"' >> /home/goose/.bashrc && \
    echo 'echo "Type goose-help for setup information"' >> /home/goose/.bashrc

# Ensure the goose binary is executable
RUN chmod +x /home/goose/.local/bin/goose || true

# Default command
CMD ["/bin/bash"]
