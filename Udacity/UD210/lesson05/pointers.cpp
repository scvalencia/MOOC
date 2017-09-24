#include <iostream>

int main(int argc, char** argv) {

    int a = 54;
    int* pa = &a;

    std::cout << pa << " " << &a << "\n";

    *pa = 100;

    std::cout << a << "\n";

    return 0;
}