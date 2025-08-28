# Goose Docker Environment

This project provides a Docker setup for running [Goose](https://block.github.io/goose/docs/getting-started/installation), an AI-powered developer assistant. Perfect for development containers and isolated environments.

## What's Included

- **Goose CLI v1.6.0**: Latest version installed and ready to use
- **Ubuntu 22.04**: Clean, secure base environment
- **Development tools**: Git, Python3, build essentials, vim, nano, zsh
- **Non-root user**: Runs as `goose` user for security
- **Easy scripts**: Simple commands to build, run, and connect
- **Persistent config**: Your Goose configuration is preserved between runs

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

## Container Structure

```
/home/goose/
├── workspace/          # Your project files (mounted from host)
├── .config/goose/      # Goose configuration (persistent volume)
├── .local/bin/goose    # Goose CLI executable
└── setup-info.sh       # Helper script with setup information
```

## Available Commands

### Host Commands
- `./run.sh` - Build and start the Goose container
- `./connect.sh` - Connect to the running container
- `docker-compose down` - Stop and remove the container
- `docker-compose logs goose` - View container logs
- `docker-compose exec goose bash` - Connect to container (alternative)

### Container Commands
- `goose configure` - Configure your LLM provider
- `goose session` - Start an interactive Goose session
- `goose --help` - Show all available Goose commands
- `goose --version` - Show Goose version (currently v1.6.0)
- `goose update` - Update Goose to the latest version
- `goose-help` - Show container setup information
- `ll` - List files with details (alias for `ls -la`)

## Configuration

- Goose config is stored in `~/.config/goose/config.yaml`
- The container mounts your workspace at `/home/goose/workspace`
- Configuration is preserved in a Docker volume between container restarts
- Extensions and settings are shared between Goose CLI and Desktop (if you use both)

## Recent Updates

- **Fixed workspace permissions**: Resolved Docker build issue where workspace directory creation failed
- **Updated paths**: Changed workspace location to `/home/goose/workspace` for proper user permissions
- **Enhanced security**: Container runs as non-root `goose` user
- **Improved documentation**: Added comprehensive command reference and troubleshooting

## Troubleshooting

### Common Issues
- **Docker build fails**: Make sure Docker is running and you have sufficient disk space
- **Permission errors**: The container now runs as non-root user to avoid permission issues
- **Keyring errors**: Set your API key as an environment variable instead of using keyring
- **Rate limits**: Make sure you have sufficient credits/quota with your chosen LLM provider
- **Connection issues**: Use `docker-compose logs goose` to view container logs

### Rebuilding the Container
If you encounter issues, try rebuilding:
```bash
docker-compose down
docker-compose build --no-cache
./run.sh
```

## More Information

- [Goose Documentation](https://block.github.io/goose/docs/getting-started/installation)
- [Goose GitHub](https://github.com/block/goose)
- [Configure LLM Providers](https://block.github.io/goose/docs/getting-started/configure-llm-provider)
