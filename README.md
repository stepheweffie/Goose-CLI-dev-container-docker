# Goose Docker Environment

This project provides a Docker setup for running [Goose](https://block.github.io/goose/docs/getting-started/installation), an AI-powered developer assistant.

## What's Included

- **Goose CLI**: Installed and ready to use
- **Ubuntu 22.04**: Clean base environment
- **Development tools**: Git, Python3, build essentials
- **Easy scripts**: Simple commands to build and run

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Quick Start

```bash
# Start the container
./run.sh

# Connect to the container
./connect.sh

# Stop the container
docker-compose down
```

### Manual Usage

If you prefer using Docker commands directly:

```bash
# Build and start
docker-compose up -d

# Connect to container
docker-compose exec goose bash

# Stop
docker-compose down
```

### Initial Setup

Once inside the container, you'll need to configure Goose with your LLM provider:

```bash
# Configure your LLM provider (you'll be prompted for API key)
goose configure

# Or set your API key as environment variable first:
export OPENAI_API_KEY=your_api_key_here
export ANTHROPIC_API_KEY=your_api_key_here
# ... then run configure
goose configure
```

### Using Goose

```bash
# Start a Goose session
goose session

# Get help
goose --help

# Update Goose to latest version
goose update

# Get setup information
goose-help
```

## Supported LLM Providers

According to the documentation, Goose works best with Claude 4 models and supports ~20 providers including:

- **OpenAI** (GPT-4o, etc.)
- **Anthropic** (Claude models)
- **Google Gemini**
- **OpenRouter** (with OAuth)
- **Tetrate Agent Router** (with OAuth)
- And many more...

## Configuration

- Goose config is stored in `~/.config/goose/config.yaml`
- The container mounts your workspace for easy file access
- Extensions and settings are shared between Goose CLI and Desktop (if you use both)

## Troubleshooting

- If you see keyring errors, set your API key as an environment variable instead
- Make sure you have sufficient credits/quota with your chosen LLM provider
- Check rate limits if you experience delays

## More Information

- [Goose Documentation](https://block.github.io/goose/docs/getting-started/installation)
- [Goose GitHub](https://github.com/block/goose)
- [Configure LLM Providers](https://block.github.io/goose/docs/getting-started/configure-llm-provider)
