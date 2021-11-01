%token NAMESPACE

%%

namespace_decl
    : NAMESPACE
    ;

%%

#include "lex.yy.c"