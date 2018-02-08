TBD 
#Překladač jazyka HeroC

##Specifikace jazyka
Základy specifikace jazyka jsou popsány v souboru `heroc-2016.pdf`. HeroC je odvozen
z jazyka C, který výrazně zjednodušuje (například uvažuje pouze jediný datový typ) a
přidává vlastní specifika.

Během syntaktické analýzy dochází k převodu čísel v osmičkové/šestnáctkové soustavě do 
soustavy desítkové.

### Zápis proměnné
Zápis proměnných je povolen pouze na záčátku bloku kódu v následujícím formátu: 
`long a;`, `long a = 20;`, `long a = b = 10;`, `long c = {3,1,4};`

### Podporované binární operátory
!= % %= & && &= * *= + += - -= / /= < << <<= <= = == > >= >> >>= ^ ^= | |= ||

### Podporované unární prefixové operátory
\* & ++ -- ~ ! -

### Podporované unární postfixové operátory
-- ++

##Spuštění
Překladač jazyka je napsán v jazyce Python s využítím nástroje ANTLR4 pro specifikaci
gramatiky jazyka a tvorby DFT. 

Vypsání abstraktního syntaktického stromu na standardní výstup je možné provést příkazem
`cat ./cesta/k/souboru/pokus.heroc | python3 ./work/print_tree.py`

Pro přeložení programu zapsaného v HeroC a vypsání na standardní výstup provede příkaz
`cat ./cesta/k/souboru/pokus.heroc | python3 ./work/compile.py > pokus.s`,
případné chyby jsou směrovány na chybový výstup, je tedy možné použít zápis `... 2> err.out`

Spustitelný soubor je možné získat spuštěním
`gcc -m64 -o pokus pokus.s herocio.c`




## Struktura překladače

### HeroC.g4
Lexikální a syntaktická pravidla gramatiky pro nástroj ANTLR4

### HeroCCustomVisitor.py
Visitor procházející strom vygenerovaný parserem, ze kterého vytváří syntaktický strom 

### compile.py
Překladač jazyka HeroC

### print_tree.py
Nástroj pro výpis AST

### ASM/ASM.py
Třída specifikuje zálohované registry, direktivu programu v assembleru a zjednodušuje
generování instrukcí v assembleru

### ASM/Registers.py
Výčtový typ představující používané registry

### AST/Node.py
Základní třída představující uzel abstraktního syntaktického stromu, rodič následujících 
typů. Pro získání kódu uzlu v assembleru je nutné přetížit metodu `asm()`

### AST/Array.py
Třída představující pole

### AST/BinaryExpression.py
Třída představující binární operaci (viz. specifikace jazyka)

### AST/Block.py
Třída představující blok kódu. Obsahuje tabulku vazeb deklarovaných proměnných a jejich
adres.

### AST/DoWhileExpression.py
Třída představující Do-While výraz. Obsahuje testovanou podmínku a tělo cyklu. Tělo cyklu
je vykonáno před testováním podmínky.

### AST/Environment.py 
Třída představující tabulku vazeb symbolů.

### AST/ForExpression.py
Třída představující For cyklus. Obsahuje inicializační výraz, testovanou podmínku, tělo cyklu
a výraz prováděný po vykonání těla.

### AST/Function.py
Třída představující funkci. Obsahuje název funkce a a její tělo.

### AST/FunctionCall.py
Třída představující volání funkce. Dodržuje konvenci CDECL, tedy prvních 6 argumentů je 
předáno přes registry, zbylé jsou vloženy na zásobník.

### AST/Identifier.py
Třída představující identifikátor. Obsahuje metodu pro výpočet adresy proměnné, v případě
nenalezení v hierarchii prostředí nastane chyba.

### AST/IfEvalStatement.py
Třída představujicí inline zápis If-Else podmínky ve tvaru `test ? pravda : nepravda`

### AST/IfStatement.py
Třída představující klasický zápis If-Else podmínky. Obsahuje testovaný výraz, blok vykonaný
v případě splnění testovaného výrazu a nepovinně blok vykonaný v případě nesplnění podmínky. 

### AST/JumpStatement.py
Třída představující výraz skoku. Může se jednat o přerušení cyklu `break`,
přerušení aktuální iterace cyklu `continue` nebo ukončení a navrácení hodnoty z funkce 
`return`. Je-li volán `return` bez parametru, vrací implicitně `O`.

### AST/Number.py
Třída představující číslo.

### AST/PostfixExpression.py
Třída představující unární postfixovou operaci (viz. specifikace). Operace vybrání prvku z 
pole je reprezentována samostatně.

### AST/Program.py
Třída představující program zapsaný v jazyce HeroC. Obsahuje inicializaci globálních proměnných
a seznam funkcí.

### AST/SemanticException.py
Třída představující sémantickou chybu. 

### AST/String.py
Třída představující řetězec. Při volání metody `asm()` se řetězec vloží na zásobník
a je navrácen ukazatel na první znak řetězce.

### AST/SubscriptExpression.py
Třída představující výběr prvku z pole.

### AST/Variable.py
Třída představující proměnnou. Obsahuje identifikátor proměnné, její typ a hodnotu. Typ 
může nabývat jedné z hodnot `ARRAY`, `LONG` nebo `POINTER`.

### AST/WhileExpression.py
Třída představující Do-While výraz. Obsahuje testovanou podmínku a tělo cyklu.Tělo cyklu
je vykonáno po testování podmínky.



