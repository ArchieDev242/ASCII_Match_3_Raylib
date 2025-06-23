#!/bin/bash

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Installing Raylib and its dependencies...${NC}"

echo -e "${YELLOW}Installing dependencies...${NC}"
sudo apt update
sudo apt install -y build-essential git cmake libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev

# cloning Raylib repository
echo -e "${YELLOW}Cloning Raylib repository...${NC}"
git clone https://github.com/raysan5/raylib.git
cd raylib

echo -e "${YELLOW}Building Raylib...${NC}"
mkdir -p build
cd build

cmake -DBUILD_SHARED_LIBS=ON ..
make

echo -e "${YELLOW}Installing Raylib...${NC}"
sudo make install

sudo ldconfig

cd ../..

echo -e "${YELLOW}Cleaning up...${NC}"
rm -rf raylib

echo -e "${GREEN}Raylib has been successfully installed!${NC}"