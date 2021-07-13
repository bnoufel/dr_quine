NAME=Sully

SRC = $(NAME).s
OBJS = 	$(SRC:%.s=%.o)
CC= nasm -f macho64

all: $(NAME)

$(NAME): $(OBJS)
	@ld $(OBJS) -macosx_version_min 10.8 -lSystem -o $(NAME)

%.o: %.s
	@echo "$(NAME): Compiling: $<..."
	$(CC) -o $@ $<

clean:
	@echo "$(NAME): Removing objects dir..."
	@/bin/rm -f $(OBJS) Sully*.o

fclean: clean
	@echo "$(NAME): Deleting..."
	@/bin/rm -f $(NAME) Sully_* Sully a.out

re: fclean all

.PHONY: all, clean, fclean, re

.SUFFIXES: .s .o .h