#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Goose Docker Environment${NC}"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker is not running. Please start Docker first.${NC}"
    exit 1
fi

# Build and run the container
echo -e "${YELLOW}📦 Building Docker image...${NC}"
docker-compose build

echo -e "${YELLOW}🔧 Starting container...${NC}"
docker-compose up -d

echo -e "${GREEN}✅ Container started successfully!${NC}"
echo -e "${BLUE}📋 To connect to the container, run:${NC}"
echo -e "${GREEN}   docker-compose exec goose bash${NC}"
echo ""
echo -e "${BLUE}📋 Or use the connect script:${NC}"
echo -e "${GREEN}   ./connect.sh${NC}"
echo ""
echo -e "${BLUE}📋 To stop the container:${NC}"
echo -e "${GREEN}   docker-compose down${NC}"
