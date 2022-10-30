#include <stdio.h>
#include <stdlib.h>
int	i = 5;
int	main()
{
	if (i >= 0)
	{
		--i;
		char	buff[64];
		snprintf(buff, sizeof(buff), "Sully_%d.c", i);
		FILE	*fptr = fopen(buff, "w");
		char *f = "#include <stdio.h>%c#include <stdlib.h>%cint i = %d%cint main()%c{%c	if (i >= 0)%c	{%c		i--;%c		char	buff[64];%c		snprintf(buff, sizeof(buff), %cSully_%d.c%c, i);%c		FILE	*fptr = fopen(buff, %cw%c);%c		char *f = %c%s%c;%cfprintf(fptr, f, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 34, i, 34, 10, 34, 34, 10, 34, f, 34, 10, 10, 10);%c	}%c	return(0);}";
		fprintf(fptr, f, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 34, i, 34, 10, 34, 34, 10, 34, f, 34, 10, 10, 10);
		// system("clang -Wall -Wextra -Werror -o Sully_kid.c Sully.c");
	}
	return(0);
}
