NAME=Sully

SRC = $(NAME).c
OBJS = 	$(SRC:%.c=%.o)
CC=gcc -Wall -Wextra -Werror --std=gnu99

all: $(NAME)

$(NAME): $(OBJS)
	@$(CC) $(OBJS) -o $(NAME)

%.o: %.c
	@echo "$(NAME): Compiling: $<..."
	@$(CC) -c -o $@ $<

clean:
	@echo "$(NAME): Removing objects dir..."
	@/bin/rm -f $(OBJS) $(NAME)_*

fclean: clean
	@echo "$(NAME): Deleting..."
	@/bin/rm -f $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re

.SUFFIXES: .c .o .h