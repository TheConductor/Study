// hello.cpp: Alex Aziz
// Description: a program that prints the immortal saying "hello world"

#include <iostream>
#include <iomanip>
using namespace std;

int main() {
  for(int i=0; i<6; i++){
   for(int i=0; i<4; i++){
      cout << setw(17) << std::left << "Hello World!";
    }
  cout << endl;
  }
  return 0;
}
