#include <stdio.h>

/*
	I'm outside
*/

void	dum(void){return;}

int	main(void)
{
	/*
		inside
	*/
	char	*f = "#include <stdio.h>%c%c/*%c	I'm outside%c*/%c%cvoid	dum(void){return;}%c%cint	main(void)%c{%c	/*%c		inside%c	*/%c	char	*f = %c%s%c;%c	printf(f, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, f, 34, 10, 10, 10);%c	return (0);%c}";
	printf(f, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, f, 34, 10, 10, 10);
	return (0);
}