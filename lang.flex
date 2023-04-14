// LÁSARO DE ALMEIDA DEODORO
// DENER LUIS BASILIO THEODORO

  /*  Esta seção é copiada antes da declaração da classe do analisador léxico gerado.
  *  É nesta seção que se deve incluir imports e declaração de pacotes.
  *  Neste exemplo não temos nada a incluir nesta seção.
  */

%%

  /* Nesta seção são definidas ERs e configurações da ferramenta */

%unicode
%line
%column
%class LextTest

// %function nextToken : nome da funções
// %type Token : tipo do Token retornado
%standalone // somente léxico, sem sintático


%{
  private int ntks;
  private void incTks() { ++ntks; }
  private int numTokens() { return ntks; }
%}

%init{
  ntks = 0; // copiado para o construtor
%init}


WHITE_SPACE_CHAR=[\ \n\r\t\b]
MetaSimbolos = [(){}\[\];,:.]|[:][:]|[&][&]|[\"]|[\']
DB = [\\][\\]
BA = [\\][\']
BOOL = true|false
// CHAR = '\\(.{1})'
ID = [a-z][a-zA-Z0-9_]*
INT = 0|[1-9][0-9]*
FLOAT = [1-9][0-9]*[.][0-9]*|[0][.][0-9]*|[.][0-9]*
PLUS = [+]
SUB = [-]
MULT = [*]
DIV = [/]
MOD = [%]
SYMB = [=][=]|[<][=]|[>][=]|[!][=]|[=<>!%]
COMMENT =  --[^\n|\r]*|\{\-[\s\S]*?\-\}

%%

<YYINITIAL>{                                                         
  "Int"                  {System.out.println("INT");               }
  "Char"                 {System.out.println("CHAR");              }
  "Bool"                 {System.out.println("BOOL");              }
  "Float"                {System.out.println("FLOAT");             }
  "if"                   {System.out.println("IF");                }
  "else"                 {System.out.println("ELSE");              }
  "iterate"              {System.out.println("ITERATE");           }
  "print"                {System.out.println("PRINT");             }
  "read"                 {System.out.println("READ");              }
  "return"               {System.out.println("RETURN");            }
  "null"                 {System.out.println("NULL");              }
  "new"                  {System.out.println("NEW");               }
         
  {MetaSimbolos    }     {System.out.println(yytext());            }
  {DB              }     {System.out.println("\\");                }
  {BA              }     {System.out.println("'");                 }
  {COMMENT         }     {                                         }
  {WHITE_SPACE_CHAR}     {                                         }

  {PLUS            }     {System.out.println("PLUS");              }
  {SUB             }     {System.out.println("SUB");               }
  {MULT            }     {System.out.println("MULT");              }
  {DIV             }     {System.out.println("DIV");               }
  {MOD             }     {System.out.println("MOD");               }

  {CHAR            }     {System.out.println("CHAR:" + yytext());  }
  {BOOL            }     {System.out.println("BOOL:" + yytext());  }
  {SYMB            }     {System.out.println(yytext());            }
  {ID              }     {System.out.println("ID:" + yytext());    }
  {INT             }     {System.out.println("INT:" + yytext());   }
  {FLOAT           }     {System.out.println("FLOAT:" + yytext()); }

}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }