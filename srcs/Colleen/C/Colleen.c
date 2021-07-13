#include <stdio.h>

/* One comment */
void	print(void)
{
	char	*print_str = "#include <stdio.h>%1$c%1$c/* One comment */%1$cvoid%2$cprint(void)%1$c{%1$c%2$cchar%2$c*print_str = %3$c%4$s%3$c;%1$c%2$cprintf(%3$c%4$s%3$c, 10, 9, 34, print_str);%1$c}%1$c%1$cint%2$c%2$cmain(void)%1$c{%1$c%2$c/* Another comment */%1$c%2$cprint();%1$c%2$creturn (0);%1$c}%1$c";
	printf("#include <stdio.h>%1$c%1$c/* One comment */%1$cvoid%2$cprint(void)%1$c{%1$c%2$cchar%2$c*print_str = %3$c%4$s%3$c;%1$c%2$cprintf(%3$c%4$s%3$c, 10, 9, 34, print_str);%1$c}%1$c%1$cint%2$c%2$cmain(void)%1$c{%1$c%2$c/* Another comment */%1$c%2$cprint();%1$c%2$creturn (0);%1$c}%1$c", 10, 9, 34, print_str);
}

int		main(void)
{
	/* Another comment */
	print();
	return (0);
}
