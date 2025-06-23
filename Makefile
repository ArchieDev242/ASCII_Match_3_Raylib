PROJECT_NAME = ASCII_Match_3_Raylib
SRC_DIR = src
BUILD_DIR = build
ASSETS_DIR = assets
SCRIPTS_DIR = scripts

# colors for terminal output
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
PURPLE = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m
NC = \033[0m

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O3
DEBUG_FLAGS = -std=c99 -Wall -Wextra -g -O0 -DDEBUG

RAYLIB_FLAGS = $(shell pkg-config --cflags raylib)
RAYLIB_LIBS = $(shell pkg-config --libs raylib)

# source files
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

.PHONY: all clean setup install uninstall run debug help

all: $(BUILD_DIR)/$(PROJECT_NAME)

setup:
	@echo "$(CYAN)Setting up $(PROJECT_NAME)...$(NC)"
	@chmod +x $(SCRIPTS_DIR)/install_raylib.sh
	@$(SCRIPTS_DIR)/install_raylib.sh
	@mkdir -p $(BUILD_DIR)
	@echo "$(GREEN)Setup completed! You can now run 'make' to build the game.$(NC)"

$(BUILD_DIR)/$(PROJECT_NAME): $(OBJECTS) | $(BUILD_DIR)
	@echo "$(BLUE)Linking $(PROJECT_NAME)...$(NC)"
	$(CC) $(OBJECTS) -o $@ $(RAYLIB_LIBS)
	@if [ -d "$(ASSETS_DIR)" ]; then \
		echo "$(YELLOW)Copying assets to build directory...$(NC)"; \
		cp -r $(ASSETS_DIR) $(BUILD_DIR)/; \
	fi
	@echo "$(GREEN)Build completed! Executable: $(BUILD_DIR)/$(PROJECT_NAME)$(NC)"

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	@echo "$(YELLOW)Compiling $<...$(NC)"
	$(CC) $(CFLAGS) $(RAYLIB_FLAGS) -c $< -o $@

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# debug building
debug: CFLAGS = $(DEBUG_FLAGS)
debug: $(BUILD_DIR)/$(PROJECT_NAME)
	@echo "$(PURPLE)Debug build completed!$(NC)"

run: $(BUILD_DIR)/$(PROJECT_NAME)
	@echo "$(CYAN)Starting $(PROJECT_NAME)...$(NC)"
	@cd $(BUILD_DIR) && ./$(PROJECT_NAME)

clean:
	@echo "$(RED)Cleaning build directory...$(NC)"
	@rm -rf $(BUILD_DIR)
	@echo "$(GREEN)Clean completed!$(NC)"

install: $(BUILD_DIR)/$(PROJECT_NAME)
	@echo "$(BLUE)Installing $(PROJECT_NAME)...$(NC)"
	@sudo cp $(BUILD_DIR)/$(PROJECT_NAME) /usr/local/bin/
	@sudo mkdir -p /usr/local/share/$(PROJECT_NAME)
	@if [ -d "$(ASSETS_DIR)" ]; then \
		sudo cp -r $(ASSETS_DIR) /usr/local/share/$(PROJECT_NAME)/; \
	fi
	@echo "$(GREEN)Installation completed! You can now run '$(PROJECT_NAME)' from anywhere.$(NC)"

uninstall:
	@echo "$(RED)Uninstalling $(PROJECT_NAME)...$(NC)"
	@sudo rm -f /usr/local/bin/$(PROJECT_NAME)
	@sudo rm -rf /usr/local/share/$(PROJECT_NAME)
	@echo "$(GREEN)Uninstallation completed!$(NC)"

help:
	@echo "$(CYAN)$(PROJECT_NAME) Build System$(NC)"
	@echo ""
	@echo "$(WHITE)Available targets:$(NC)"
	@echo "  $(GREEN)check-raylib$(NC) - Check if RayLib is installed"
	@echo "  $(GREEN)setup$(NC)      - Install RayLib and prepare build environment"
	@echo "  $(GREEN)all$(NC)        - Build the game (default)"
	@echo "  $(GREEN)debug$(NC)      - Build with debug symbols"
	@echo "  $(GREEN)run$(NC)        - Build and run the game"
	@echo "  $(GREEN)clean$(NC)      - Remove build artifacts"
	@echo "  $(GREEN)install$(NC)    - Install game system-wide (requires sudo)"
	@echo "  $(GREEN)uninstall$(NC)  - Remove installed game"
	@echo "  $(GREEN)help$(NC)       - Show this help message"
	@echo ""
	@echo "$(WHITE)Quick start:$(NC)"
	@echo "  $(YELLOW)make setup$(NC)    # First time setup"
	@echo "  $(YELLOW)make run$(NC)      # Build and run the game"

check-raylib:
	@if ! pkg-config --exists raylib; then \
		echo "$(RED)RayLib not found! Please run 'make setup' first.$(NC)"; \
		exit 1; \
	fi

$(BUILD_DIR)/$(PROJECT_NAME): check-raylib