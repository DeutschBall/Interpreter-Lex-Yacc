
struct Token{
   char* name;
   int type;
   double value;
   double (* FuncPtr)(double);
};
