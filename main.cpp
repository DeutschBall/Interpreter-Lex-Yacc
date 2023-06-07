#include <stdio.h>
#include <fstream>
#include <iostream>
#include <string>
#include "y.tab.h"
using std::cout;
using std::endl;
using std::ifstream;
using std::ofstream;
using std::string;
ofstream fout;
ifstream fin;
const int maxn = 1000;
extern FILE *yyin;
void init()
{
    fout.open("drawer.py", ofstream::out | ofstream::app);

    if (!fout.is_open())
    {
        cout << "file open filed" << endl;
        return;
    }
    fout << "import matplotlib.pyplot as plt" << endl;
    fout << "fig, ax = plt.subplots(figsize=(10,10))" << endl;
    fout << "ax.set_xlim(0, 500)" << endl;
    fout << "ax.set_ylim(0, 500)" << endl;
    fout << "fig.canvas.manager.set_window_title('DustComp')" << endl;
    return;
}
void draw(double x, double y)
{
    char buffer[maxn];
    sprintf(buffer, "ax.scatter(%lf, %lf, s=1, c='black')", x, y);
    fout << buffer << endl;
}
void close()
{
    fout << "ax.set_xticks([])" << endl;
    fout << "ax.set_yticks([])" << endl;
    fout << "plt.show()" << endl;
    fout.close();
}
int main(int argc, char *argv[])
{

    FILE *inputFile = fopen(argv[1], "r");
    if (!inputFile)
    {
        perror("file open failed");
        return 1;
    }

    init();

    yyin = inputFile;

    yyparse();

    fclose(inputFile);

    close();

    return 0;
}
