#include <stdio.h>
#define _MAIN() int	main(){FILE	*fptr;/*hey*/fptr = fopen("Grace_kid.c", "w");char	*f = "#include <stdio.h>%c#define _MAIN() int	main(){FILE	*fptr;/*hey*/fptr = fopen(%cGrace_kid.c%c, %cw%c);char	*f = %c%s%c;fprintf(fptr, f, 10, 34, 34, 34, 34, 34, f, 34, 10);fclose(fptr);return(0);}%c_MAIN();";fprintf(fptr, f, 10, 34, 34, 34, 34, 34, f, 34, 10);fclose(fptr);return(0);}
_MAIN();