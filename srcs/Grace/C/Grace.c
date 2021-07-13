#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
/*
	My Comment
*/
#define NAME "Grace_kid.c"
#define STR "#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c/*%1$c%4$cMy Comment%1$c*/%1$c#define NAME %2$cGrace_kid.c%2$c%1$c#define STR %2$c%3$s%2$c%1$c#define FT(x)int main() {int fd; if ((fd = open(NAME, O_TRUNC | O_CREAT | O_RDWR, 0777)) == -1) return 1; dprintf(fd, STR, 10, 34, STR, 9); close(fd); return 0;}%1$c%1$cFT(STR)"
#define FT(x)int main() {int fd; if ((fd = open(NAME, O_TRUNC | O_CREAT | O_RDWR, 0777)) == -1) return 1; dprintf(fd, STR, 10, 34, STR, 9); close(fd); return 0;}

FT(STR)