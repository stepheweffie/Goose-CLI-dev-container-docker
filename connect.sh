#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔗 Connecting to Goose container...${NC}"

# Check if container is running
if ! docker-compose ps goose | grep -q "Up"; then
    echo -e "${RED}❌ Container is not running. Start it first with:${NC}"
    echo -e "${GREEN}   ./run.sh${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Connected! You're now inside the Goose container.${NC}"
echo -e "${BLUE}💡 Type 'goose-help' for setup information${NC}"
echo ""

# Connect to the container
docker-compose exec goose bash
