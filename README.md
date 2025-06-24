<div align = "center">

# ASCII Match 3 Game 🎮

![Tech Stack](https://skillicons.dev/icons?i=c,cmake,linux,git,vscode&theme=dark)

**Built with C • Raylib • CMake • Linux**

*A classic Match 3 puzzle game featuring ASCII-style graphics and smooth animations*

</div>

---

A classic Match 3 puzzle game built with **C** and **Raylib**, featuring ASCII-style graphics and smooth animations. This project demonstrates modern C programming practices, build system configuration with CMake and Make, and game development fundamentals.

> **P.S.** This game was created by following a tutorial for learning and practicing **C programming** and **Raylib** game development. It serves as an educational project to demonstrate fundamental game development concepts and modern C coding practices.

## 🎥 Gameplay Demo

<div align = "center">

[![Video]([media/MATCH3_ASCII.mp4](https://github.com/ArchieDev242/ASCII_Match_3_Raylib/blob/main/media/MATCH3_ASCII.mp4))](https://github.com/user-attachments/assets/a0fe7b42-cd2f-4455-9364-e79f40824c71)

*Experience the classic Match 3 gameplay with smooth ASCII animations!*

</div>

## ✨ Features

- **Classic Match 3 Mechanics**: Match 3 or more tiles to score points
- **Smooth Animations**: Falling tiles with physics-based movement
- **ASCII Art Style**: Retro terminal-inspired visual design
- **Score System**: Points tracking with animated feedback
- **Sound Effects**: Audio feedback for matches and interactions
- **Cross-Platform**: Runs on Linux, Windows, and macOS

## 🛠️ Technologies Used

This project was an excellent learning experience covering multiple technologies:

- **C Programming Language**: Core game logic and memory management
- **Raylib**: 2D graphics rendering, input handling, and audio
- **CMake**: Modern build system configuration and cross-platform compilation
- **Make**: Traditional build automation and project management
- **Git**: Version control and project history

## 🚀 Quick Start

### Prerequisites

- GCC compiler
- Git
- CMake (optional, for CMake build)
- pkg-config

### Installation & Running

1. **Clone the repository**
   ```bash
   git clone https://github.com/ArchieDev242/ASCII_Match_3_Raylib.git
   cd ASCII_Match_3_Raylib
   ```

2. **Setup and run** (automated installation)
   ```bash
   make setup    # Installs Raylib and dependencies
   make run      # Builds and runs the game
   ```

   Or manually:
   ```bash
   # Install Raylib
   chmod +x scripts/install_raylib.sh
   ./scripts/install_raylib.sh
   
   # Build and run
   make
   ./build/ASCII_Match_3_Raylib
   ```

### Alternative CMake Build

```bash
mkdir build && cd build
cmake ..
make
./ASCII_Match_3_Raylib
```

## 🎮 How to Play

- **Mouse**: Click to select tiles
- **Match**: Swap adjacent tiles to create lines of 3+ identical symbols
- **Score**: Earn points for each successful match
- **Goal**: Get the highest score possible!

### Game Symbols
- `#` - Hash tiles
- `@` - At symbol tiles  
- `$` - Dollar tiles
- `%` - Percent tiles
- `&` - Ampersand tiles

## 📁 Project Structure

```
ASCII_Match_3_Raylib/
├── src/
│   └── main.c              # Main game logic
├── assets/
│   ├── 04b03.ttf          # Pixel font
│   ├── bg.jpg             # Background image
│   ├── matched.mp3        # Match sound effect
│   └── Pixel Dreams.mp3   # Background music
├── scripts/
│   ├── install_raylib.sh  # Raylib installation script
│   └── ascii_match3.desktop.in  # Linux desktop entry
├── media/
│   └── MATCH3_ASCII.mp4   # Gameplay demonstration video
├── CMakeLists.txt         # CMake configuration
├── Makefile              # Make build configuration
└── README.md             # This file
```

## 🔧 Build System Features

### Makefile Targets

- `make setup` - Install Raylib and prepare environment
- `make` or `make all` - Build the game (default)
- `make run` - Build and run the game
- `make clean` - Remove build artifacts
- `make install` - Install game system-wide
- `make uninstall` - Remove installed game
- `make help` - Show available commands

### CMake Configuration

The project includes a modern CMake setup with:
- Automatic Raylib detection
- Cross-platform compatibility
- Proper dependency management
- Debug/Release configurations

## 🎓 Learning Journey

This project helped me master several key concepts:

### C Programming
- Memory management and pointers
- 2D array manipulation for game boards
- Game loop architecture
- State management

### Raylib Framework
- 2D rendering and textures
- Input handling (mouse/keyboard)
- Audio system integration
- Font rendering and UI

### Build Systems
- **CMake**: Modern build system configuration
  - Target-based builds
  - Dependency management
  - Cross-platform compilation
- **Make**: Traditional automation
  - Phony targets
  - Pattern rules
  - Colored output

### Project Organization
- Modular code structure
- Asset management
- Cross-platform deployment
- Documentation practices

## 🌟 Credits & Special Thanks

This project exists thanks to an absolutely **amazing tutorial** that changed my understanding of game development!

### 🎓 Original Tutorial
**[Learn to Code a 2D ASCII Match 3 Game with C and Raylib](https://youtu.be/P7PMA3X1tf8?si=IEsZ7lsXPLBkC54I)** by **FreeCodeCamp**

This comprehensive 1 hour tutorial is a masterpiece of game development education. It covers everything from basic C programming concepts to advanced game mechanics, all while building a complete, playable game.

### 👨‍🏫 Original Author: Erik Yuzwa
**Massive thanks** to [**Erik Yuzwa**](https://github.com/erikyuzwa) for creating this incredible learning resource! 

- **Original Repository**: [erikyuzwa/raylib-2d-ascii-match-3](https://github.com/erikyuzwa/raylib-2d-ascii-match-3)
- **Tutorial Quality**: Professional-grade explanation of complex concepts
- **Teaching Style**: Perfect balance of theory and hands-on coding
- **Impact**: This tutorial made game development accessible and enjoyable

### 🏆 Why This Tutorial Rocks
- **Complete Game**: From setup to finished product
- **Modern C Practices**: Clean, well-structured code
- **Raylib Mastery**: Excellent introduction to the framework  
- **Learning Path**: Perfect progression from beginner to intermediate
- **Production Ready**: Real game development workflows

### 🙏 Thank You FreeCodeCamp!
Huge appreciation to the [**FreeCodeCamp**](https://www.freecodecamp.org/) team for providing such high-quality, **completely free** educational content. This platform has revolutionized programming education worldwide.

**If this tutorial helped you learn, please:**
- ⭐ Star Erik's original repository
- 👍 Like the YouTube tutorial  
- 🔔 Subscribe to FreeCodeCamp
- 💖 Support their mission of free education

### 🤖 AI-Generated Assets

This project showcases the power of modern AI tools for creative content generation:

- **🖼️ Background Image** (`bg.jpg`) - Created with [**Reve Image**](https://preview.reve.art/) AI art generator
- **🔊 Match Sound Effect** (`matched.mp3`) - Generated using [**Foley AI**](https://www.foley-ai.com/) for realistic audio feedback
- **🎵 Background Music** (`Pixel Dreams.mp3`) - Composed by [**Suno AI**](https://suno.com/about) music generator

These AI tools demonstrate how modern technology can enhance game development by providing high-quality assets quickly and efficiently!

## 🎮 More Cool Projects

Looking for more awesome game development tutorials? Check out:
- [FreeCodeCamp YouTube Channel](https://www.youtube.com/@freecodecamp) - Thousands of hours of free programming education
- [Raylib Examples](https://www.raylib.com/examples.html) - Official Raylib game examples
- [Erik Yuzwa's GitHub](https://github.com/erikyuzwa) - More game development projects

---

⭐ **Star this repository if you found it helpful for learning C and game development!**

*Built with ❤️ following FreeCodeCamp's amazing tutorial*
