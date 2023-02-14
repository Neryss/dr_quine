#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int	i = 5;
int	main()
{
	char	buff[1024];
	char	make[1024];
	char	exec[1024];
	snprintf(buff, sizeof(buff), "Sully_%d.c", i);
	FILE	*fptr = fopen(buff, "w");
	char	*trimmed = strdup(buff);
	trimmed[strlen(trimmed) - 2] = '\0';
	char *f = "#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%cint	i = %d;%cint	main()%c{%c	char	buff[1024];%c	char	make[1024];%c	char	exec[1024];%c	snprintf(buff, sizeof(buff), %cSully_%cd.c%c, i);%c	FILE	*fptr = fopen(buff, %cw%c);%c	char	*trimmed = strdup(buff);%c	trimmed[strlen(trimmed) - 2] = %c%c0%c;%c	char *f = %c%s%c;%c	fprintf(fptr, f, 10, 10, 10, i - 1, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 34, 10, 10, 39, 92, 39, 10, 34, f, 34, 10, 10, 10, 34, 37, 37, 34, 10, 34, 37, 34, 10, 10, 10, 10, 10, 10, 10, 10);%c	fclose(fptr);%c	snprintf(make, sizeof(make), %cclang -Wall -Wextra -Werror -o %cs %cs%c, trimmed, buff);%c	snprintf(exec, sizeof(exec), %c./%cs%c, trimmed);%c	system(make);%c	if (i > 0)%c	{%c		i--;%c		system(exec);%c	}%c	return(0);%c}";
	fprintf(fptr, f, 10, 10, 10, i - 1, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 34, 10, 10, 39, 92, 39, 10, 34, f, 34, 10, 10, 10, 34, 37, 37, 34, 10, 34, 37, 34, 10, 10, 10, 10, 10, 10, 10, 10);
	fclose(fptr);
	snprintf(make, sizeof(make), "clang -Wall -Wextra -Werror -o %s %s", trimmed, buff);
	snprintf(exec, sizeof(exec), "./%s", trimmed);
	system(make);
	if (i > 0)
	{
		i--;
		system(exec);
	}
	return(0);
}