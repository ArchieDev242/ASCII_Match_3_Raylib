#!/bin/bash

# colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}ASCII Match 3 - RayLib Installation Script${NC}"
echo -e "${YELLOW}Installing RayLib and its dependencies...${NC}"

# Check if RayLib is already installed
if pkg-config --exists raylib; then
    echo -e "${GREEN}RayLib is already installed!${NC}"
    raylib_version=$(pkg-config --modversion raylib)
    echo -e "${GREEN}Version: ${raylib_version}${NC}"
    exit 0
fi

echo -e "${YELLOW}Installing system dependencies...${NC}"
sudo apt update

# install only essential dependencies for RayLib
sudo apt install -y \
    build-essential \
    git \
    cmake \
    pkg-config \
    libasound2-dev \
    libx11-dev \
    libxrandr-dev \
    libxi-dev \
    libxcursor-dev \
    libxinerama-dev \
    libgl1-mesa-dev

# temp directory for cloning RayLib
TEMP_DIR=$(mktemp -d)
echo -e "${YELLOW}Using temporary directory: ${TEMP_DIR}${NC}"

echo -e "${YELLOW}Cloning RayLib repository...${NC}"
cd "$TEMP_DIR"
git clone --depth 1 https://github.com/raysan5/raylib.git
cd raylib

echo -e "${YELLOW}Building RayLib...${NC}"
mkdir -p build
cd build

# Cmake configuration
cmake -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_GAMES=OFF \
      ..

make -j$(nproc)

echo -e "${YELLOW}Installing RayLib...${NC}"
sudo make install

sudo ldconfig

if pkg-config --exists raylib; then
    raylib_version=$(pkg-config --modversion raylib)
    echo -e "${GREEN}RayLib ${raylib_version} has been successfully installed!${NC}"
else
    echo -e "${RED}Installation failed! RayLib not found.${NC}"
    exit 1
fi

echo -e "${YELLOW}Cleaning up temporary files...${NC}"
cd /
rm -rf "$TEMP_DIR"

echo -e "${GREEN}Installation completed successfully!${NC}"