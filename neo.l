NUMBER  [0-9]
TEXT    [a-zA-Z_]

%{
    #include "neo.tab.h"
    #include <stdio.h>

    void unexpected_token();
%}

%%
"//"[^\n]*                  { /* single line comments */ }

"namespace"                 { return(NAMESPACE); }
{TEXT}({TEXT}|{NUMBER})*    { return(IDENTIFIER); }

";"                         { return(';'); }

[ \t\v\n\f]                 {}
.                           { unexpected_token(); }
%%

void unexpected_token() {
    char msg[256];
    sprintf(msg, "unexpected token '%s'", yytext);
    yyerror(msg);
}