# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2
SRC_DIR = src
DRIVER_DIR = drivers
FIRMWARE_DIR = firmware

# File search patterns
SRC_FILES = $(shell find $(SRC_DIR) -name '*.c')
DRIVER_FILES = $(shell find $(DRIVER_DIR) -name '*.c')
FIRMWARE_FILES = $(shell find $(FIRMWARE_DIR) -name '*.c')

# Object file lists
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.c=$(DRIVER_DIR)/%.o) \
            $(DRIVER_FILES:$(DRIVER_DIR)/%.c=$(DRIVER_DIR)/%.o) \
            $(FIRMWARE_FILES:$(FIRMWARE_DIR)/%.c=$(FIRMWARE_DIR)/%.o)

# Targets
.PHONY: all clean

all: $(OBJ_FILES)

# Rule to compile .c files to .o files
$(DRIVER_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(DRIVER_DIR)/%.o: $(DRIVER_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(FIRMWARE_DIR)/%.o: $(FIRMWARE_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated object files
clean:
	rm -rf $(DRIVER_DIR)/*.o $(FIRMWARE_DIR)/*.o $(DRIVER_DIR)/**/*.o $(FIRMWARE_DIR)/**/*.o