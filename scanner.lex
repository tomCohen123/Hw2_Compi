%{
/* Declarations section */
#include <stdio.h>
#include "parser.tab.hpp"
#include "output.hpp"
%}

%option yylineno
%option noyywrap
digit			([0-9])		
letter			([a-zA-Z])
digit_without_zero   ([1-9])
id	{letter}({letter}|{digit})*
num 0|{digit_without_zero}{digit}*
whitespace ([\t\n\r ])
sc ;
comma ,
lparen \(
rparen \)
lbrace \{
rbrace \}
assign =
relop <|>|<=|>=
relop_equality ==|!=
plus_minus \+|\-
multi_dev \*|\/
comment  \/\/[^\n\r]*[\r|\n|\r\n]?
string \"([^\n\r\"\\]|\\[rnt"\\])+\"

%%
void                        return VOID;
int                         return INT;
byte                        return BYTE;
b                           return B;
bool                        return BOOL;
const                       return CONST;
and                         return AND;
or                          return OR;
not                         return NOT;
true                        return TRUE;
false                       return FALSE;
return                      return RETURN;
if                          return IF;
else                        return ELSE;
while                       return WHILE;
break                       return BREAK;
continue                    return CONTINUE;
{sc}			     		    return SC;
{comma}                     return COMMA;
{lparen}                   return LPAREN;
{rparen}                    return RPAREN;
{lbrace}                    return LBRACE;
{rbrace}                    return RBRACE;
{assign}                    return ASSIGN;
{relop}                     return RELOP;
{relop_equality}            return RELOP_EQUALITY;
{multi_dev}                 return MULTI_DEV;
{plus_minus}                return PLUS_MINUS;
{comment} ;
{id}                        return ID;
{num}                       return NUM;
{string}                    return STRING;
{whitespace} ;
.                           {
                             output::errorLex(yylineno);
                             exit(0);
                            };
%%


