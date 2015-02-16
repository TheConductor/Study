#include <iostream>
#include <string>
using namespace std;
int main(int argc, char* argv[])
{
   int array_size = 5;
   int arr[5];
    cout << "Input:" << endl;
    cout << "Enter " << array_size << " numbers: ";
    ///{Write your code here
    for(int i=0; i<array_size; i++){
        cin >> arr[i];
    }
    cout << endl;
    cout << "Output:";
    cout << "Array is: ";
    for(int i=0; i<array_size; i++){
        cout << arr[i] << endl;
    }
    ///}
   return 0;
}
