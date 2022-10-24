#include <stdio.h>

int	main()
{
	/*
		comment
	*/

	FILE	*fptr;
	fptr = fopen("Grace_kid.c", "w");
	char	*f = "#include <stdio.h>%c%cint	main()%c{%c	/*%c		comment%c	*/%c%c	FILE	*fptr;%c	fptr = fopen(%cGrace_kid.c%c, %cw%c);%c	char	*f = %c%s%c;%c	fprintf(fptr, f, 34, f, 34);%c	fclose(fptr);%c	return(0);%c}";
	fprintf(fptr, f, 34, f, 34);
	fclose(fptr);
	return(0);
}