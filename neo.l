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
"struct"                    { return(STRUCT); }
"class"                     { return(CLASS); }
"enum"                      { return(ENUM); }
"use"                       { return(USE); }
{TEXT}({TEXT}|{NUMBER})*    { return(IDENTIFIER); }
\"(\\.|[^\\"\n])*\"         { return(STRING_LITERAL); }
{NUMBER}*                   { return(INT_LITERAL); }

"="                         { return('='); }
"["                         { return('['); }
"]"                         { return(']'); }
"{"                         { return('{'); }
"}"                         { return('}'); }
"("                         { return('('); }
")"                         { return(')'); }
";"                         { return(';'); }
","                         { return(','); }

[ \t\v\n\f]                 {}
.                           { unexpected_token(); }
%%

void unexpected_token() {
    char msg[256];
    sprintf(msg, "unexpected token '%s'", yytext);
    yyerror(msg);
}