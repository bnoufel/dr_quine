#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#ifndef R
#define R 0
#endif
int main(){
int fd,i=5;if(i<=0)return 1;char *p,*b,*c,*n="Sully_",*s="#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c#ifndef R%1$c#define R 0%1$c#endif%1$cint main(){%1$cint fd,i=%2$d;if(i<=0)return 1;char *p,*b,*c,*n=%3$cSully_%3$c,*s=%3$c%4$s%3$c;asprintf(&b,%3$c%%s%%d%3$c,n,i-R);asprintf(&p,%3$c%%s.c%3$c,b);if ((fd=open(p,O_CREAT|O_WRONLY|O_TRUNC,0777)) == -1) return 1;%1$cdprintf(fd, s, 10, i-R, 34, s);asprintf(&c, %3$cgcc -DR %%s -o %%s%3$c, p, b);system(c);free(c);asprintf(&c, %3$c./%%s%3$c, b);system(c);close(fd);free(b);free(c);free(p);return 1;}";asprintf(&b,"%s%d",n,i-R);asprintf(&p,"%s.c",b);if ((fd=open(p,O_CREAT|O_WRONLY|O_TRUNC,0777)) == -1) return 1;
dprintf(fd, s, 10, i-R, 34, s);asprintf(&c, "gcc -DR %s -o %s", p, b);system(c);free(c);asprintf(&c, "./%s", b);system(c);close(fd);free(b);free(c);free(p);return 1;}