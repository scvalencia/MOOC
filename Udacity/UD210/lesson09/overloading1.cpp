#include <iostream>

int findSmaller(int a, int b) {
    return (a < b) ? a : b;
}

float findSmaller(float a, float b) {
    return (a < b) ? a : b;
}

char findSmaller(char a, char b) {
    return (a < b) ? a : b;
}

int main(int argc, char** argv) {

    int i1 = 5, i2 = 6;
    float f1 = 5.43, f2 = 6.34;
    char c1 = 'a', c2 = 'b';

    std::cout << findSmaller(i1, i2) << std::endl;
    std::cout << findSmaller(f1, f2) << std::endl;
    std::cout << findSmaller(c1, c2) << std::endl;

    return 0;
}