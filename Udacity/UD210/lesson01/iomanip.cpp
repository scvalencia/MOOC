#include <iostream>
#include <iomanip>

using namespace std;
int main(int charv, char** argv) {

    const int WIDTH = 20;

    int a = 45;
    float b = 45.323;
    double c = 45.4568;

    int aa = a + 9;
    float bb = b + 9;
    double cc = c + 9;

    int aaa = aa + 9;
    float bbb = bb + 9;
    double ccc = cc + 9;

    cout << "Ints" << setw(WIDTH) << "Floats" << setw(WIDTH) << "Double\n";

    cout << "---------------------------------------------\n";

    cout << a << setw(WIDTH + 2) << b << setw(WIDTH) << c << "\n";
    cout << aa << setw(WIDTH + 2) << bb << setw(WIDTH) << cc << "\n";
    cout << aaa << setw(WIDTH + 2) << bbb << setw(WIDTH) << ccc << "\n";

    return 0;
}