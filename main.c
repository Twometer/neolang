#include <stdio.h>

int yyparse(void);

int main(void)
{
    return yyparse();
}

void yyerror(char *error_message)
{
    fprintf(stderr, "Error: %s\nExiting\n", error_message);
}