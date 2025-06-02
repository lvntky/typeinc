# === Project Configuration ===
CC        := gcc
CSTD      := -std=c2x
CFLAGS    := -Wall -Wextra -Werror -pedantic $(CSTD) -Iinclude
LDFLAGS   := -lcmark
BIN_DIR   := bin
SRC_DIR   := src

# === Source Files ===
SRCS      := $(wildcard $(SRC_DIR)/*.c)
OBJS      := $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%.o, $(SRCS))
TARGETS   := $(BIN_DIR)/bloggen $(BIN_DIR)/blogd

# === Build Rules ===
.PHONY: all clean run bloggen blogd

all: $(TARGETS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN_DIR)/bloggen: $(BIN_DIR)/bloggen.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(BIN_DIR)/blogd: $(BIN_DIR)/blogd.o
	$(CC) $(CFLAGS) -o $@ $^

bloggen: $(BIN_DIR)/bloggen
blogd:   $(BIN_DIR)/blogd

run: bloggen blogd
	./$(BIN_DIR)/bloggen
	./$(BIN_DIR)/blogd

clean:
	rm -rf $(BIN_DIR)
