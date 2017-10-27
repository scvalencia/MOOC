#include <iostream>

class Compare {

    public:

        int findSmaller(int a, int b) {
            return (a < b) ? a : b;
        }
        
        float findSmaller(float a, float b) {
            return (a < b) ? a : b;
        }
        
        char findSmaller(char a, char b) {
            return (a < b) ? a : b;
        }

        int findSmaller(int arrc, int* arrv) {
            int min = 10000;

            for(int i = 0; i < arrc; i++) {
                int arri = arrv[i];
                min = (min < arri) ? min : arri;
            }

            return min;
        }

};

int main(int argc, char** argv) {

    Compare c;

    int i1 = 5, i2 = 6;
    float f1 = 5.43, f2 = 6.34;
    char c1 = 'a', c2 = 'b';

    int array[] = {1, 2, 3, 4, 5, 6};

    std::cout << c.findSmaller(i1, i2) << std::endl;
    std::cout << c.findSmaller(f1, f2) << std::endl;
    std::cout << c.findSmaller(c1, c2) << std::endl;
    std::cout << c.findSmaller(6, array) << std::endl;

    return 0;
}