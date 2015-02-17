#include <iostream>    
using namespace std;     
    
int main()    
{    
   int a,b;    
   cout<<"Enter 1st number:";    
   cin>>a;    
   cout<<"Enter 2nd number:";    
   cin>>b;    
    
    ///{Write your code here    
    int c;
    c = b;
    b = a;
    a = c;
    
    ///}    
    
    
    cout<<a<<" "<<b<<endl;     
    return 0;    
}    
