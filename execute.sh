flex switch.l
yacc -d switch.y -o switch.cc
gcc -c lex.yy.c -o lex.yy.o
g++ lex.yy.o switch.cc
./a.out<inp.txt
