YACC=yacc
LEX=lex
CPP=g++ -std=c++11 -w



main: y.tab.c lex.yy.c main.cpp token.h y.tab.h
	$(CPP) y.tab.c lex.yy.c main.cpp -o main
y.tab.c y.tab.h: yacc.y
	$(YACC) -d yacc.y
lex.yy.c: lex.l
	$(LEX) -d lex.l

clean:
	rm main drawer.py lex.yy.c y.tab.c y.tab.h
run:
	./main test.txt
draw:
	python drawer.py