#include "header.hpp"
#include <sstream>

int main(int argc, char** argv) {
    string length;

    float inches, yardage;

    cout << "Enter number of inches: ";
    getline(cin, length);
    stringstream(length) >> inches;

    cout << "You entered " << inches << "\n";

    yardage = inches / 36;
    cout << "Yardage is " << yardage << "\n";

    return 0;
}