#include <cmath>
#include <iostream>

int main(int argc, char** argv) {
    int a, b;

    std::cout << "Enter the first number a: ";
    std::cin >> a;

    std::cout << "Enter the second number b: ";
    std::cin >> b;

    std::cout << "\n\n";

    std::cout << "a + b = " << a + b << "\n";
    std::cout << "a - b = " << a - b << "\n";
    std::cout << "a * b = " << a * b << "\n";
    std::cout << "a / b = " << a / b << "\n";
    std::cout << "a % b = " << a % b << "\n";
    std::cout << "a ^ b = " << std::pow(a, b) << "\n";

}