#include <stdio.h>
// #define	_main() int	main(){FILE	*fptr; fptr = fopen("Grace_kid", "w"); fclose(fptr);return(0);}

int	main()
{
	/*
		comment
	*/

	FILE	*fptr;
	fptr = fopen("Grace_kid.c", "w");
	char	*f = "#include <stdio.h>\n\nint	main()\n{\n	/*\n		comment\n	*/\n\n	FILE	*fptr;\n	fptr = fopen(\"Grace_kid.c\", \"w\");\n	return(0);\n}";
	fprintf(fptr, "%s", f);
	fclose(fptr);
	return(0);
}

// _main();