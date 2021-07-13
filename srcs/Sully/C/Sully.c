#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#ifndef R
#define R 0
#endif
int main() {
	int fd;
	int i = 5;
	if(i <= 0)
		return 1;
	char *p;
	char *b;
	char *c;
	char *n = "Sully_";
	char *s = "#define _GNU_SOURCE%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c#ifndef R%1$c#define R 0%1$c#endif%1$cint main() {%1$c%2$cint fd;%1$c%2$cint i = %3$d;%1$c%2$cif(i <= 0)%1$c%2$c%2$creturn 1;%1$c%2$cchar *p;%1$c%2$cchar *b;%1$c%2$cchar *c;%1$c%2$cchar *n = %4$cSully_%4$c;%1$c%2$cchar *s = %4$c%5$s%4$c;%1$c%2$casprintf(&b,%4$c%%s%%d%4$c,n,i-R);%1$c%2$casprintf(&p,%4$c%%s.c%4$c,b);%1$c%2$cif ((fd=open(p,O_CREAT|O_WRONLY|O_TRUNC,0777)) == -1)%1$c%2$c%2$creturn 1;%1$c%2$cdprintf(fd, s, 10, 9, i-R, 34, s);%1$c%2$casprintf(&c, %4$cgcc -DR %%s -o %%s%4$c, p, b);%1$c%2$csystem(c);%1$c%2$cfree(c);%1$c%2$casprintf(&c, %4$c./%%s%4$c, b);%1$c%2$csystem(c);%1$c%2$cclose(fd);%1$c%2$cfree(b);%1$c%2$cfree(c);%1$c%2$cfree(p);%1$c%2$creturn 1;%1$c}%1$c";
	asprintf(&b,"%s%d",n,i-R);
	asprintf(&p,"%s.c",b);
	if ((fd=open(p,O_CREAT|O_WRONLY|O_TRUNC,0777)) == -1)
		return 1;
	dprintf(fd, s, 10, 9, i-R, 34, s);
	asprintf(&c, "gcc -DR %s -o %s", p, b);
	system(c);
	free(c);
	asprintf(&c, "./%s", b);
	system(c);
	close(fd);
	free(b);
	free(c);
	free(p);
	return 1;
}
