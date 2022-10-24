#include <stdio.h>
#define _main() int	main(){FILE	*fptr;fptr = fopen("Grace_kid.c", "w");char	*f = "#include <stdio.h>%c#define _main() int	main(){FILE	*fptr;fptr = fopen(%cGrace_kid.c%c, %cw%c);char	*f = %c%s%c;fprintf(fptr, f, 10, 34, 34, 34, 34, 34, f, 34, 10);fclose(fptr);return(0);}%c_main();";fprintf(fptr, f, 10, 34, 34, 34, 34, 34, f, 34, 10);fclose(fptr);return(0);}
_main();