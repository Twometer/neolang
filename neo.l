NUMBER  [0-9]
TEXT    [a-zA-Z_]

%{
    #include "neo.tab.h"
    #include <stdio.h>

    void unexpected_token();
    void consume_multiline_comment();
%}

%%
"//"[^\n]*                  { /* single line comment */ }
"/*"                        { consume_multiline_comment(); }

"namespace"                 { return(NAMESPACE); }
"struct"                    { return(STRUCT); }
"class"                     { return(CLASS); }
"enum"                      { return(ENUM); }
"use"                       { return(USE); }
"if"                        { return(IF); }
"else"                      { return(ELSE); }
"while"                     { return(WHILE); }
"do"                        { return(DO); }
"for"                       { return(FOR); }
"return"                    { return(RETURN); }
"api"                       { return(API); }
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

void consume_multiline_comment() {
    char chr, prev = '\0';

    while ((chr = input()) != 0) {
        if (chr == '/' && prev == '*')
            return;
        prev = chr;
    }

    error("unterminated comment");
}