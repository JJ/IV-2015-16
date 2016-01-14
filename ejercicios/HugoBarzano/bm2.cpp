#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdlib.h>
#include <vector> 
#include <string>
#include <time.h>
#include <algorithm>
#include <map>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <stdio.h>
#include <sys/stat.h>
#include <ctype.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

using namespace std;


#define SIZE          8192  /* buffer size for reading /proc/<pid>/status */



//utilizando la información que el sistema operativo almacena dentro del directorio /proc** esta funcion devuelve la memoria total usada por el programa (memoria de datos + memoria de pila) en kilobytes. No necesita ningún parámetro.
int mem_total ()
{
  char a[SIZE], *p, *q;
  int data, stack;
  int n, v, fd;
  pid_t pid= getpid();

  p = a;
  sprintf (p, "/proc/%d/status", pid);
  fd = open (p, O_RDONLY);
  if (fd < 0)
    return -1;
  do
    n = read (fd, p, SIZE);
  while ((n < 0) && (errno == EINTR));
  if (n < 0)
    return -2;
  do
    v = close (fd);
  while ((v < 0) && (errno == EINTR));
  if (v < 0)
    return -3;
  data = stack = 0;
  q = strstr (p, "VmData:");
  if (q != NULL)
    {
      sscanf (q, "%*s %d", &data);
      q = strstr (q, "VmStk:");
      if (q != NULL)
    sscanf (q, "%*s %d\n", &stack);
    }
  return (data + stack);
}












int main() {


//TEST DE MEMORIA
// creo un vector en memoria dinamica de 2.500.000 enteros, que son 2.500.000 * 32 = 80.000.000 bits = 8.000.000 bytes = 9765 kbytes = 9,5 mb aproximadamente, lo suficiente para que no quepa en cache. Lo escribo y lo leo 200 veces.

cout<<"\n\n### TEST DE MEMORIA ### \n";

int *vector;
int aux;

clock_t start;
clock_t end;

cout<<"Memoria usada, al comienzo del test: "<<mem_total()<<" Kb\n";
//clock_t tdespues;
vector = new int[2500000];

start=clock();

cout<<"\nPasando test de Memoria...\n"<<endl;
for(int i=0;i<200;i++){
//Escritura en vector
for(int j=0;j<2500000;j++) vector[j]=j;
//Lectura del vector
for(int j=0;j<2500000;j++) aux = vector[j];
}


end=clock();
cout<<"Memoria usada, al finalizar el test: "<<mem_total()<<" Kb\n";


  double dif = end-start;
  cout <<"Tiempo: " << dif/CLOCKS_PER_SEC <<" segundos\n\n";
}

