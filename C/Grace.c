#include <stdio.h>
#define _main() int	main(){FILE	*fptr;fptr = fopen("Grace_kid.c", "w");char	*f = "#include <stdio.h>%c#define _main() int	main(){FILE	*fptr;fptr = fopen(%cGrace_kid.c%c, %cw%c);%c	char	*f = %c%s%c;%c	fprintf(fptr, f, 34, f, 34);%c	fclose(fptr);%c	return(0);%c}";fprintf(fptr, f, 10, 34, 34, 34, 34, 10, 34, f, 34, 10, 10, 10, 10);fclose(fptr);return(0);}

_main();