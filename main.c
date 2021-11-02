#include <stdio.h>
#include <string.h>

int yyparse(void);

int main(int argc, char **argv)
{
    if (argc >= 2 && strcmp(argv[1], "--debug") == 0)
    {
        extern int yydebug;
        yydebug = 1;
    }

    return yyparse();
}

void yyerror(char *error_message)
{
    fprintf(stderr, "Error: %s\nExiting\n", error_message);
}