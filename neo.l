%{
    #include "neo.tab.h"
%}

%%
"//"[^\n]* { /* single line comments */ }
"namespace"         { return (NAMESPACE); }
.                   { error("Unexpected character"); }
%%