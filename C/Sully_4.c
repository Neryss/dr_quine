#include <stdio.h>
#include <stdlib.h>
int	i = 4;
int	main()
{
	if (i >= 0)
	{
		--i;
		char	buff[1024];
		char	make[1024];
		snprintf(buff, sizeof(buff), "Sully_%d.c", i);
		FILE	*fptr = fopen(buff, "w");
		char *f = "#include <stdio.h>%c#include <stdlib.h>%cint	i = %d;%cint	main()%c{%c	if (i >= 0)%c	{%c		--i;%c		char	buff[1024];%c		char	make[1024];%c		snprintf(buff, sizeof(buff), %cSully_%cd.c%c, i);%c		FILE	*fptr = fopen(buff, %cw%c);%c		char *f = %c%s%c;%c		fprintf(fptr, f, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 34, 10, 34, f, 34, 10, 10, 10, 34, 37, 37, 34, 10, 10, 10, 10);		%c		fclose(fptr);%c		snprintf(make, sizeof(make), %cclang -Wall -Wextra -Werror -o %cs %cs%c, buff, buff);%c		%c	}%c	return(0);%c}";
		fprintf(fptr, f, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 34, 10, 34, f, 34, 10, 10, 10, 34, 37, 37, 34, 10, 10, 10, 10);		
		fclose(fptr);
		snprintf(make, sizeof(make), "clang -Wall -Wextra -Werror -o %s %s", buff, buff);
		
	}
	return(0);
}