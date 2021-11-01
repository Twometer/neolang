%token NAMESPACE IDENTIFIER

%start entry_point
%%

entry_point
    : namespace_decl
    ;

namespace_decl
    : NAMESPACE IDENTIFIER ';'
    ;

%%

#include "lex.yy.c"