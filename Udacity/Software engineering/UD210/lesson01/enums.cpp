#include <iostream>

using namespace std;

int main(int argc, char** argv) {
    enum COLOR {Red, Green, Blue};

    COLOR favColor = Red;

    if(favColor == Red)
        cout << "The favourite color is red" << endl;
    else if(favColor == Green)
        cout << "The favourite color is green" << endl;
    else
        cout << "The favourite color is blue" << endl;

    return 0;
    
}