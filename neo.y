%token NAMESPACE USE ENUM STRUCT CLASS
%token IDENTIFIER STRING_LITERAL INT_LITERAL
%token IF ELSE WHILE DO FOR RETURN API

%start entry_point
%%

entry_point
    : global_statement
    | global_statement entry_point
    ;

global_statement
    : namespace_statement
    | use_statement
    | enum_block
    | struct_block
    | class_block
    | method_block
    ;

namespace_statement
    : NAMESPACE IDENTIFIER ';'
    ;

use_statement
    : USE STRING_LITERAL ';'
    ;

constant_expression
    : INT_LITERAL
    ;

conditional_expression
    : 
    ;

field_declaration
    : IDENTIFIER IDENTIFIER ';'
    ;

modifier
    : API
    ;

attribute
    : '[' IDENTIFIER ']'

enum_block
    : attribute enum_block
    | modifier enum_block
    | ENUM IDENTIFIER '{' enum_list '}'
    ;

enum_list
    : enum_entry
    | enum_entry ','
    | enum_entry ',' enum_list
    ;

enum_entry
    : IDENTIFIER
    | IDENTIFIER '=' constant_expression
    ;


struct_block
    : attribute struct_block
    | modifier struct_block
    | STRUCT IDENTIFIER '{' struct_body '}'
    ;

struct_body
    : field_declaration
    | field_declaration struct_body
    ;


class_block
    : attribute class_block
    | modifier class_block
    | CLASS IDENTIFIER '{' class_body '}'
    ;

class_body
    : field_declaration
    | field_declaration class_body
    | method_block
    | method_block class_body
    ;


method_block
    : modifier method_block
    | IDENTIFIER '(' argument_list ')' '{' method_body '}' 
    | IDENTIFIER IDENTIFIER '(' argument_list ')' '{' method_body '}' 
    ;

method_body
    : if_block
    ;

argument_list
    : argument
    | argument ',' argument_list
    | 
    ;

argument
    : IDENTIFIER IDENTIFIER
    | IDENTIFIER IDENTIFIER '=' constant_expression
    ;




%%

#include "lex.yy.c"