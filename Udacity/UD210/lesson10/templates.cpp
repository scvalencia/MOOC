#include <iostream>

using namespace std;

template <typename T>
T findSmaller(T arg1, T arg2) {
    return (arg1 < arg2) ? arg1 : arg2;
}

template <typename T, typename U>
T findBigger(T arg1, U arg2) {
    return (arg1 > arg2) ? arg1 : arg2;
}

template <typename T>
T sum(T arg1, T arg2) {
    return arg1 + arg2;
}

int main(int argc, char** argv) {
    int a = 54, b = 89;
    float c = 7.8, d = 9.1;
    char e = 'f', f = 'h';
    string g = "Hello", h = "Bots are fun";

    cout << "MIN-INT: " << findSmaller(a, b) << endl;
    cout << "MIN-FLOAT: " << findSmaller(c, d) << endl;
    cout << "MIN-CHAR: " << findSmaller(e, f) << endl;
    cout << "MIN-STRING: " << findSmaller(g, h) << endl;

    cout << endl;

    for(int i = 0; i < 30; i++)
        cout << '*';

    cout << endl << endl;

    cout << "SUM-INT: " << sum(a, b) << endl;
    cout << "SUM-FLOAT: " << sum(c, d) << endl;
    cout << "SUM-CHAR: " << sum(e, f) << endl;
    cout << "SUM-STRING: " << sum(g, h) << endl;

    cout << endl;
    
    for(int i = 0; i < 30; i++)
        cout << '*';
    
    cout << endl << endl;

    cout << "MAX-INT: " << findBigger(a, c) << endl;
    cout << "MAX-FLOAT: " << findBigger(c, a) << endl;
}