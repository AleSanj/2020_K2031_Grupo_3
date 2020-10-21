
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "tp4.y"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern FILE* yyin;
extern int yylineno;

int yylex();
void yyerror (char *s){
    printf("ERROR SINTACTICO EN LA LINEA: %d",yylineno);
}



/* Line 189 of yacc.c  */
#line 88 "tp4.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CTEDEC = 258,
     CTEOCT = 259,
     CTEHEX = 260,
     CTEREAL = 261,
     ID = 262,
     TIPO_DE_DATO = 263,
     SIZEOF = 264,
     LITCAD = 265,
     AND = 266,
     OR = 267,
     MAYORIGUAL = 268,
     MENORIGUAL = 269,
     PORCENTAJE = 270,
     IGUALDAD = 271,
     DISTINTO = 272,
     INCREMENTO = 273,
     PUNTERO = 274,
     MULTIPLICAR = 275,
     DIVIDIR = 276,
     SUMAR = 277,
     RESTAR = 278,
     CARACTER = 279,
     SWITCH = 280,
     CASE = 281,
     ELSE = 282,
     BREAK = 283,
     DEFAULT = 284,
     RETURN = 285,
     IF = 286,
     DO = 287,
     FOR = 288,
     WHILE = 289,
     VOID = 290,
     TIPO_DE_FUNCION = 291,
     STRUCT = 292,
     UNION = 293,
     TYPEDEF = 294
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 14 "tp4.y"

    char* cadena;
    char car;
    int nro;
    float nrocoma;



/* Line 214 of yacc.c  */
#line 172 "tp4.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */

/* Line 264 of yacc.c  */
#line 21 "tp4.y"

 typedef struct Nodo {
    char* Palabra;
    char* Tipo;
    int Linea; 
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char*,char*,int);
void RecorrerListaVariables(NODO*); 
void RecorrerListaFunciones(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char*,char*);
void InsertarAlPpio(NODO** , char*,char*,int);
void insertarAlFinal(NODO**,char*,char*,int);

NODO* listaVars = NULL;
NODO* listaFunciones = NULL;
char* tipoId;
char* tipoFun;
int flagTipo;


/* Line 264 of yacc.c  */
#line 209 "tp4.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   417

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  60
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  119
/* YYNRULES -- Number of states.  */
#define YYNSTATES  221

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   294

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      40,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    56,     2,     2,     2,     2,    54,     2,
      45,    46,    48,    51,    44,    52,     2,    53,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    59,    42,
      50,    47,    49,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    57,     2,    58,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    41,     2,    43,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,    55,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    14,    17,    20,
      23,    25,    36,    38,    42,    43,    48,    50,    52,    53,
      55,    58,    60,    66,    68,    74,    80,    84,    86,    87,
      89,    93,    96,    98,   102,   104,   108,   110,   113,   115,
     117,   119,   121,   123,   125,   128,   130,   132,   136,   138,
     140,   142,   144,   148,   150,   154,   156,   160,   164,   166,
     170,   174,   178,   182,   184,   188,   192,   194,   198,   202,
     204,   207,   210,   215,   217,   219,   221,   223,   225,   230,
     235,   239,   241,   245,   247,   249,   251,   255,   256,   258,
     260,   262,   264,   266,   268,   270,   274,   276,   279,   280,
     288,   289,   296,   300,   301,   304,   311,   318,   323,   324,
     327,   330,   333,   334,   341,   342,   351,   352,   356,   365
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      61,     0,    -1,    -1,    61,    62,    -1,    40,    -1,    96,
      -1,    96,    40,    -1,    77,    69,    -1,    78,    70,    -1,
      39,    64,    -1,    64,    -1,    67,     7,    41,     8,    65,
      42,    66,    43,    68,    42,    -1,     7,    -1,     7,    44,
      65,    -1,    -1,     8,    65,    42,    66,    -1,    37,    -1,
      38,    -1,    -1,     7,    -1,    75,    42,    -1,    70,    -1,
       7,    45,    73,    46,    97,    -1,    71,    -1,     7,    45,
      73,    46,    42,    -1,     7,    45,    72,    46,    42,    -1,
      77,    44,    72,    -1,    77,    -1,    -1,    74,    -1,    74,
      44,    73,    -1,     8,     7,    -1,    76,    -1,    76,    44,
      75,    -1,     7,    -1,     7,    47,    81,    -1,     8,    -1,
       8,    48,    -1,    36,    -1,     3,    -1,     4,    -1,     5,
      -1,     6,    -1,    24,    -1,    82,    42,    -1,    82,    -1,
      84,    -1,    91,    83,    82,    -1,    47,    -1,    22,    -1,
      85,    -1,    86,    -1,    85,    12,    86,    -1,    87,    -1,
      86,    11,    87,    -1,    88,    -1,    87,    16,    88,    -1,
      87,    17,    88,    -1,    89,    -1,    88,    13,    89,    -1,
      88,    49,    89,    -1,    88,    14,    89,    -1,    88,    50,
      89,    -1,    90,    -1,    89,    51,    90,    -1,    89,    52,
      90,    -1,    91,    -1,    90,    48,    91,    -1,    90,    53,
      91,    -1,    93,    -1,    18,    91,    -1,    92,    91,    -1,
       9,    45,    77,    46,    -1,    54,    -1,    48,    -1,    55,
      -1,    56,    -1,    95,    -1,    93,    57,    80,    58,    -1,
      93,    45,    94,    46,    -1,    93,    45,    46,    -1,    82,
      -1,    94,    44,    82,    -1,     7,    -1,    79,    -1,    10,
      -1,    45,    80,    46,    -1,    -1,    42,    -1,    80,    -1,
      63,    -1,    97,    -1,    99,    -1,   106,    -1,   105,    -1,
      41,    98,    43,    -1,    96,    -1,    98,    96,    -1,    -1,
      31,   100,    45,    81,    46,    97,   103,    -1,    -1,    25,
     101,    45,    81,    46,   102,    -1,    41,   104,    43,    -1,
      -1,    27,    97,    -1,    26,    81,    59,    96,   104,   105,
      -1,     7,    81,    59,    96,   104,   105,    -1,    29,    59,
      96,   105,    -1,    -1,    28,    42,    -1,    30,    42,    -1,
      30,    80,    -1,    -1,    34,   107,    45,    81,    46,    97,
      -1,    -1,    32,   108,    97,    34,    45,    81,    46,    42,
      -1,    -1,    33,   109,   110,    -1,    45,    81,    42,    81,
      42,    81,    46,    97,    -1,    45,    42,    42,    46,    97,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    78,    78,    79,    81,    82,    83,    88,    89,    90,
      91,    94,    97,    98,   101,   102,   104,   105,   107,   108,
     111,   112,   114,   115,   118,   119,   121,   122,   124,   125,
     126,   129,   131,   132,   136,   137,   140,   141,   143,   145,
     146,   147,   148,   149,   152,   154,   156,   157,   159,   160,
     162,   164,   165,   167,   168,   170,   171,   172,   174,   175,
     176,   177,   178,   181,   182,   183,   185,   186,   187,   189,
     190,   191,   192,   194,   195,   196,   197,   199,   200,   201,
     202,   204,   205,   208,   209,   210,   211,   213,   214,   215,
     216,   217,   218,   219,   220,   225,   227,   228,   230,   230,
     231,   231,   234,   236,   237,   240,   241,   242,   244,   245,
     246,   247,   250,   250,   251,   251,   252,   252,   254,   255
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CTEDEC", "CTEOCT", "CTEHEX", "CTEREAL",
  "ID", "TIPO_DE_DATO", "SIZEOF", "LITCAD", "AND", "OR", "MAYORIGUAL",
  "MENORIGUAL", "PORCENTAJE", "IGUALDAD", "DISTINTO", "INCREMENTO",
  "PUNTERO", "MULTIPLICAR", "DIVIDIR", "SUMAR", "RESTAR", "CARACTER",
  "SWITCH", "CASE", "ELSE", "BREAK", "DEFAULT", "RETURN", "IF", "DO",
  "FOR", "WHILE", "VOID", "TIPO_DE_FUNCION", "STRUCT", "UNION", "TYPEDEF",
  "'\\n'", "'{'", "';'", "'}'", "','", "'('", "')'", "'='", "'*'", "'>'",
  "'<'", "'+'", "'-'", "'/'", "'&'", "'â'", "'!'", "'['", "']'", "':'",
  "$accept", "input", "line", "declaracion", "struct", "muchosIds",
  "masDeclaraciones", "structOunion", "idONo", "funcionovar", "funcion",
  "prototipo", "listaSoloTipos", "listaParametros", "parametroSuelto",
  "listaIds", "identificador", "tipoDato", "tipoFuncion", "num",
  "expresion", "expresionSelecc", "expAsignacion", "operAsignacion",
  "expCondicional", "expOr", "expAnd", "expIgualdad", "expRelacional",
  "expAditiva", "expMultiplicativa", "expUnaria", "operUnario",
  "expPostfijo", "listaArgumentos", "expPrimaria", "sentencia",
  "sentenciaComp", "listaSentencias", "sentenciaSeleccion", "$@1", "$@2",
  "sentenciaDelSwitch", "sentenciaElse", "sentenciaEtiquetada",
  "sentenciaCorte", "sentenciaIteracion", "$@3", "$@4", "$@5",
  "sentenciaFor", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
      10,   123,    59,   125,    44,    40,    41,    61,    42,    62,
      60,    43,    45,    47,    38,   226,    33,    91,    93,    58
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    60,    61,    61,    62,    62,    62,    63,    63,    63,
      63,    64,    65,    65,    66,    66,    67,    67,    68,    68,
      69,    69,    70,    70,    71,    71,    72,    72,    73,    73,
      73,    74,    75,    75,    76,    76,    77,    77,    78,    79,
      79,    79,    79,    79,    80,    81,    82,    82,    83,    83,
      84,    85,    85,    86,    86,    87,    87,    87,    88,    88,
      88,    88,    88,    89,    89,    89,    90,    90,    90,    91,
      91,    91,    91,    92,    92,    92,    92,    93,    93,    93,
      93,    94,    94,    95,    95,    95,    95,    96,    96,    96,
      96,    96,    96,    96,    96,    97,    98,    98,   100,    99,
     101,    99,   102,   103,   103,   104,   104,   104,   105,   105,
     105,   105,   107,   106,   108,   106,   109,   106,   110,   110
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     2,     1,     1,     2,     2,     2,     2,
       1,    10,     1,     3,     0,     4,     1,     1,     0,     1,
       2,     1,     5,     1,     5,     5,     3,     1,     0,     1,
       3,     2,     1,     3,     1,     3,     1,     2,     1,     1,
       1,     1,     1,     1,     2,     1,     1,     3,     1,     1,
       1,     1,     3,     1,     3,     1,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     1,
       2,     2,     4,     1,     1,     1,     1,     1,     4,     4,
       3,     1,     3,     1,     1,     1,     3,     0,     1,     1,
       1,     1,     1,     1,     1,     3,     1,     2,     0,     7,
       0,     6,     3,     0,     2,     6,     6,     4,     0,     2,
       2,     2,     0,     6,     0,     8,     0,     3,     8,     5
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,     0,     1,    39,    40,    41,    42,    83,    36,     0,
      85,     0,    43,   100,     0,     0,    98,   114,   116,   112,
      38,    16,    17,     0,     4,    87,    88,     0,    74,    73,
      75,    76,     3,    90,    10,     0,     0,     0,    84,    89,
       0,    46,    50,    51,    53,    55,    58,    63,    66,     0,
      69,    77,     5,    91,    92,    94,    93,    37,     0,    70,
       0,   109,   110,   111,     0,     0,     0,     0,     9,    96,
       0,     0,     0,    34,     7,    21,    23,     0,    32,     0,
       8,    44,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    49,    48,     0,    71,     0,     0,
       6,     0,     0,     0,     0,     0,   117,     0,    95,    97,
      86,     0,    28,     0,    20,     0,    52,    66,    54,    56,
      57,    59,    61,    60,    62,    64,    65,    67,    68,    47,
      80,    81,     0,     0,    72,     0,    45,     0,     0,     0,
       0,     0,     0,    36,     0,     0,    29,    27,    35,    34,
      33,     0,    79,    78,     0,     0,     0,     0,     0,     0,
      12,     0,    31,     0,     0,    28,     0,    82,     0,   101,
     103,     0,     0,     0,   113,     0,    14,    25,    24,    22,
       0,    30,    26,     0,     0,     0,     0,     0,    99,     0,
     119,     0,    13,     0,     0,     0,     0,    87,   102,   104,
     115,     0,     0,    18,    87,    87,   108,     0,    14,    19,
       0,     0,     0,   107,   118,    15,    11,   108,   108,   106,
     105
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,    32,    33,    34,   161,   194,    35,   210,    74,
      75,    76,   144,   145,   146,    77,    78,    36,    37,    38,
      39,   135,   136,    96,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   132,    51,    52,    53,    70,    54,
      64,    60,   169,   188,   186,    55,    56,    67,    65,    66,
     106
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -166
static const yytype_int16 yypact[] =
{
    -166,   129,  -166,  -166,  -166,  -166,  -166,  -166,   -42,   -22,
    -166,   361,  -166,  -166,   -15,    26,  -166,  -166,  -166,  -166,
    -166,  -166,  -166,    14,  -166,   237,  -166,   361,  -166,  -166,
    -166,  -166,  -166,  -166,  -166,    10,    32,    52,  -166,  -166,
      28,  -166,    54,    76,    39,    -2,    24,   -28,    -9,   361,
     -23,  -166,    49,  -166,  -166,  -166,  -166,  -166,    86,  -166,
      55,  -166,  -166,  -166,    57,    58,    59,    60,  -166,  -166,
     183,    61,    62,   -26,  -166,  -166,  -166,    64,    66,    63,
    -166,  -166,   361,   361,   361,   361,   361,   361,   361,   361,
     361,   361,   361,   361,  -166,  -166,   361,  -166,   291,   361,
    -166,    79,   361,   361,    92,   307,  -166,   361,  -166,  -166,
    -166,   119,   120,   361,  -166,   123,    76,  -166,    39,    -2,
      -2,    24,    24,    24,    24,   -28,   -28,  -166,  -166,  -166,
    -166,  -166,    21,    73,  -166,    94,  -166,    95,    97,   101,
     103,   100,   141,     1,   105,   106,   111,   112,  -166,   102,
    -166,   361,  -166,  -166,   117,    58,   361,   118,   361,    58,
     128,   133,  -166,   134,    31,   170,    86,  -166,    11,  -166,
     152,   136,    58,   153,  -166,   141,   186,  -166,  -166,  -166,
     190,  -166,  -166,   361,   361,   139,   156,    58,  -166,   158,
    -166,   361,  -166,   141,   159,   146,   147,   237,  -166,  -166,
    -166,   163,   168,   205,   237,   237,    15,    58,   186,  -166,
     176,    11,    11,  -166,  -166,  -166,  -166,    15,    15,  -166,
    -166
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -166,  -166,  -166,  -166,   200,  -165,    19,  -166,  -166,  -166,
     192,  -166,    67,    65,  -166,   121,  -166,   -55,  -166,  -166,
     -11,   -98,    -1,  -166,  -166,  -166,   150,   151,    -7,   -25,
       0,    30,  -166,  -166,  -166,  -166,   -24,   -63,  -166,  -166,
    -166,  -166,  -166,  -166,  -128,  -164,  -166,  -166,  -166,  -166,
    -166
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      40,    69,   104,   101,    63,   137,    57,   140,   162,   141,
     192,    86,    87,    94,    40,   148,    71,    72,   183,   112,
      92,   113,    98,    58,    40,    93,    40,    61,   202,     3,
       4,     5,     6,     7,    99,     9,    10,   184,    95,    73,
     185,    59,   213,    14,    11,    15,   109,    88,    89,    57,
      12,    21,    22,   219,   220,    84,    85,   147,   171,    79,
     173,   121,   122,   123,   124,   151,    82,   152,    62,    40,
      81,    27,    25,   178,    28,    90,    91,   119,   120,    97,
      29,    30,    31,   217,   218,   195,   196,    83,   133,   100,
     125,   126,   170,   201,     8,   129,   174,   131,    40,    25,
     102,   179,   103,   111,   105,   107,   114,   110,   112,   190,
     115,   147,   117,   117,   117,   117,   117,   117,   117,   117,
     117,   117,   127,   128,   199,   134,   138,   142,   143,     2,
     149,   153,     3,     4,     5,     6,     7,     8,     9,    10,
     154,   155,   156,   157,   214,   158,   159,    11,   160,   113,
     167,   163,   164,    12,    13,   165,   166,    14,   168,    15,
      16,    17,    18,    19,   172,    20,    21,    22,    23,    24,
      25,    26,   175,   206,    27,   176,   177,    28,   180,   187,
     211,   212,   189,    29,    30,    31,     3,     4,     5,     6,
       7,     8,     9,    10,   193,   191,    40,   162,   197,   198,
     200,    11,   203,    40,    40,   204,   205,    12,    13,   207,
     208,    14,   209,    15,    16,    17,    18,    19,   216,    20,
      21,    22,    23,    68,    25,    26,   108,   215,    27,    80,
     181,    28,   116,   182,   118,     0,   150,    29,    30,    31,
       3,     4,     5,     6,     7,     8,     9,    10,     0,     0,
       0,     0,     0,     0,     0,    11,     0,     0,     0,     0,
       0,    12,    13,     0,     0,    14,     0,    15,    16,    17,
      18,    19,     0,    20,    21,    22,    23,     0,    25,    26,
       0,     0,    27,     0,     0,    28,     0,     0,     0,     0,
       0,    29,    30,    31,     3,     4,     5,     6,     7,     0,
       9,    10,     0,     0,     0,     0,     0,     0,     0,    11,
       3,     4,     5,     6,     7,    12,     9,    10,     0,     0,
       0,     0,     0,     0,     0,    11,     0,     0,     0,     0,
       0,    12,     0,     0,     0,     0,    27,   130,     0,    28,
       0,     0,     0,     0,     0,    29,    30,    31,     0,   139,
       0,     0,    27,     0,     0,    28,     0,     0,     0,     0,
       0,    29,    30,    31,     3,     4,     5,     6,     7,     0,
       9,    10,     0,     0,     0,     0,     0,     0,     0,    11,
       0,     0,     0,     0,     0,    12,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,    28,
       0,     0,     0,     0,     0,    29,    30,    31
};

static const yytype_int16 yycheck[] =
{
       1,    25,    65,    58,    15,   103,    48,   105,     7,   107,
     175,    13,    14,    22,    15,   113,    27,     7,     7,    45,
      48,    47,    45,    45,    25,    53,    27,    42,   193,     3,
       4,     5,     6,     7,    57,     9,    10,    26,    47,     7,
      29,    11,   206,    28,    18,    30,    70,    49,    50,    48,
      24,    37,    38,   217,   218,    16,    17,   112,   156,     7,
     158,    86,    87,    88,    89,    44,    12,    46,    42,    70,
      42,    45,    41,    42,    48,    51,    52,    84,    85,    49,
      54,    55,    56,   211,   212,   183,   184,    11,    99,    40,
      90,    91,   155,   191,     8,    96,   159,    98,    99,    41,
      45,   164,    45,    41,    45,    45,    42,    46,    45,   172,
      44,   166,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,   187,    46,    34,     8,     8,     0,
       7,    58,     3,     4,     5,     6,     7,     8,     9,    10,
      46,    46,    45,    42,   207,    42,    46,    18,     7,    47,
     151,    46,    46,    24,    25,    44,    44,    28,    41,    30,
      31,    32,    33,    34,    46,    36,    37,    38,    39,    40,
      41,    42,    44,   197,    45,    42,    42,    48,     8,    27,
     204,   205,    46,    54,    55,    56,     3,     4,     5,     6,
       7,     8,     9,    10,     8,    42,   197,     7,    59,    43,
      42,    18,    43,   204,   205,    59,    59,    24,    25,    46,
      42,    28,     7,    30,    31,    32,    33,    34,    42,    36,
      37,    38,    39,    23,    41,    42,    43,   208,    45,    37,
     165,    48,    82,   166,    83,    -1,   115,    54,    55,    56,
       3,     4,     5,     6,     7,     8,     9,    10,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    18,    -1,    -1,    -1,    -1,
      -1,    24,    25,    -1,    -1,    28,    -1,    30,    31,    32,
      33,    34,    -1,    36,    37,    38,    39,    -1,    41,    42,
      -1,    -1,    45,    -1,    -1,    48,    -1,    -1,    -1,    -1,
      -1,    54,    55,    56,     3,     4,     5,     6,     7,    -1,
       9,    10,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    18,
       3,     4,     5,     6,     7,    24,     9,    10,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    18,    -1,    -1,    -1,    -1,
      -1,    24,    -1,    -1,    -1,    -1,    45,    46,    -1,    48,
      -1,    -1,    -1,    -1,    -1,    54,    55,    56,    -1,    42,
      -1,    -1,    45,    -1,    -1,    48,    -1,    -1,    -1,    -1,
      -1,    54,    55,    56,     3,     4,     5,     6,     7,    -1,
       9,    10,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    18,
      -1,    -1,    -1,    -1,    -1,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    45,    -1,    -1,    48,
      -1,    -1,    -1,    -1,    -1,    54,    55,    56
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    61,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    18,    24,    25,    28,    30,    31,    32,    33,    34,
      36,    37,    38,    39,    40,    41,    42,    45,    48,    54,
      55,    56,    62,    63,    64,    67,    77,    78,    79,    80,
      82,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    95,    96,    97,    99,   105,   106,    48,    45,    91,
     101,    42,    42,    80,   100,   108,   109,   107,    64,    96,
      98,    80,     7,     7,    69,    70,    71,    75,    76,     7,
      70,    42,    12,    11,    16,    17,    13,    14,    49,    50,
      51,    52,    48,    53,    22,    47,    83,    91,    45,    57,
      40,    77,    45,    45,    97,    45,   110,    45,    43,    96,
      46,    41,    45,    47,    42,    44,    86,    91,    87,    88,
      88,    89,    89,    89,    89,    90,    90,    91,    91,    82,
      46,    82,    94,    80,    46,    81,    82,    81,    34,    42,
      81,    81,     8,     8,    72,    73,    74,    77,    81,     7,
      75,    44,    46,    58,    46,    46,    45,    42,    42,    46,
       7,    65,     7,    46,    46,    44,    44,    82,    41,   102,
      97,    81,    46,    81,    97,    44,    42,    42,    42,    97,
       8,    73,    72,     7,    26,    29,   104,    27,   103,    46,
      97,    42,    65,     8,    66,    81,    81,    59,    43,    97,
      42,    81,    65,    43,    59,    59,    96,    46,    42,     7,
      68,    96,    96,   105,    97,    66,    42,   104,   104,   105,
     105
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 11:

/* Line 1455 of yacc.c  */
#line 94 "tp4.y"
    { printf( "se declaro un strcut en la linea: %d\n",yylineno);;}
    break;

  case 22:

/* Line 1455 of yacc.c  */
#line 114 "tp4.y"
    {if (flagTipo){insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoId,yylineno);};}
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 118 "tp4.y"
    {if (flagTipo){insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoId,yylineno);};}
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 119 "tp4.y"
    {if (flagTipo){insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,(yyvsp[(1) - (5)].cadena),tipoId,yylineno);};}
    break;

  case 34:

/* Line 1455 of yacc.c  */
#line 136 "tp4.y"
    {insertarAlFinal(&listaVars,(yyvsp[(1) - (1)].cadena),tipoId,yylineno);;}
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 137 "tp4.y"
    {insertarAlFinal(&listaVars,(yyvsp[(1) - (3)].cadena),tipoId,yylineno);;}
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 140 "tp4.y"
    {tipoId = (yyvsp[(1) - (1)].cadena); flagTipo=0;;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 141 "tp4.y"
    {tipoId = strcat((yyvsp[(1) - (2)].cadena),"*"); flagTipo=0;;}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 143 "tp4.y"
    {tipoFun = (yyvsp[(1) - (1)].cadena);flagTipo=1; /*El flag nos dice si es de algun tipo escpecial de funcion (void por ejemplo) o no */;}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 152 "tp4.y"
    {;}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 154 "tp4.y"
    {;}
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 230 "tp4.y"
    {printf("se encontro una sentencia IF en la linea : %d \n",yylineno);;}
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 231 "tp4.y"
    {printf("se encontro una sentencia SWITCH en la linea : %d \n", yylineno);;}
    break;

  case 112:

/* Line 1455 of yacc.c  */
#line 250 "tp4.y"
    {printf("se encontro una sentencia WHILE en la linea : %d \n", yylineno);;}
    break;

  case 114:

/* Line 1455 of yacc.c  */
#line 251 "tp4.y"
    {printf("se encontro una sentencia DO WHILE en la linea : %d \n", yylineno);;}
    break;

  case 116:

/* Line 1455 of yacc.c  */
#line 252 "tp4.y"
    {printf("se encontro una sentencia FOR en la linea : %d \n", yylineno);;}
    break;



/* Line 1455 of yacc.c  */
#line 1764 "tp4.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 259 "tp4.y"


int main ()
{

  int flag;
  yyin=fopen("entrada.c","r");
  flag=yyparse();
          printf("\n");
          RecorrerListaVariables(listaVars);
          RecorrerListaFunciones(listaFunciones);
  fclose(yyin);
  return flag;
}

NODO* CrearNodo(char* palabra,char* tipo,int linea) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra = strdup(palabra);
    nuevo_nodo->Tipo = strdup(tipo);
    nuevo_nodo->Linea = linea;
    nuevo_nodo->sgte = NULL;    
}


int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpio(NODO** l, char* palabra,char* tipo,int linea){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo,linea);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}
void insertarAlFinal(NODO** l,char* palabra,char* tipo,int linea){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo,linea);
    NODO* aux1 = *l;
    if (aux1 != NULL){

    while(aux1->sgte != NULL ){
        aux1 = aux1->sgte;
    }
    nuevo_nodo -> sgte = aux1->sgte;
    aux1 ->sgte = nuevo_nodo;
    } else {
        InsertarAlPpio(l,palabra,tipo,linea);
    }
}

int EstaElElemento(NODO*l, char* palabra,char* tipo){
    NODO* aux = l;
        do {
            if((strcmp(aux->Palabra,palabra) == 0) && (strcmp(aux->Tipo,tipo)== 0)){
                return 1;
            } 
            aux = aux->sgte;
        } while (aux != NULL);
        
        return 0;
}

void RecorrerListaVariables(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE VARIABLES ----\n");
    while (aux != NULL) {
        printf("se declaro la variable \"%s\", de tipo %s, en la linea: %d \n",aux->Palabra,aux->Tipo,aux->Linea);
        aux = aux->sgte; 
    }
}
void RecorrerListaFunciones(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE FUNCIONES ----\n");
    while (aux != NULL) {
        printf("se declaro la funcion \"%s\", de tipo %s, en la linea: %d \n",aux->Palabra,aux->Tipo,aux->Linea);
        aux = aux->sgte; 
    }
}


