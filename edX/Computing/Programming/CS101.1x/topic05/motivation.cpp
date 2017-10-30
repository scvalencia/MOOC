#include <iostream>

void sum4() {
    int a, b, c, d;

    std::cin >> a >> b >> c >> d;
    std::cout << a + b + c + d << std::endl;
}

void sum7() {
    int a, b, c, d, e, f, g;

    std::cin >> a >> b >> c >> d >> e >> f >> g;
    std::cout << a + b + c + d + e + f + g << std::endl;
}

int main(int argc, char** argv) {
    sum4();

    /* We need to store them to be able to compute several
     * statistics, or sort the numbers
    */
    return 0;
}