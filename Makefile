# === Configuration ===
CC        := gcc
CSTD      := -std=c2x
CFLAGS    := -Wall -Wextra -Werror -pedantic $(CSTD) -Iinclude
LDFLAGS   := -lcmark
BIN_DIR   := bin
SRC_DIR   := src

# === Source Files ===
SRCS      := $(wildcard $(SRC_DIR)/*.c)
OBJS      := $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%.o, $(SRCS))

TYPEGEN_SRC := $(SRC_DIR)/typegen.c
TYPED_SRC   := $(SRC_DIR)/typed.c

TYPEGEN_BIN := $(BIN_DIR)/typegen
TYPED_BIN   := $(BIN_DIR)/typed

# === Rules ===
.PHONY: all clean run typegen typed

all: $(TYPEGEN_BIN) $(TYPED_BIN)

$(TYPEGEN_BIN): $(TYPEGEN_SRC)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

$(TYPED_BIN): $(TYPED_SRC)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $<

typegen: $(TYPEGEN_BIN)
typed:   $(TYPED_BIN)

run: typegen typed
	./$(TYPEGEN_BIN)
	./$(TYPED_BIN)

clean:
	rm -rf $(BIN_DIR)
