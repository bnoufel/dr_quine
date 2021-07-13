NAME=Grace

SRC = $(NAME).s
OBJS = 	$(SRC:%.s=%.o)
NASM=nasm -f elf64
FLAGS=-Wall -Wextra -Werror -no-pie
CC=gcc $(FLAGS)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME)

%.o: %.s
	@echo "$(NAME): Compiling: $<..."
	@$(NASM) -o $@ $<

clean:
	@echo "$(NAME): Removing objects dir..."
	@/bin/rm -f $(OBJS)

fclean: clean
	@echo "$(NAME): Deleting..."
	@/bin/rm -f $(NAME) $(NAME)_kid.s

re: fclean all

.PHONY: all, clean, fclean, re

.SUFFIXES: .c .o .h