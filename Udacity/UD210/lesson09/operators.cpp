#include <iostream>

using namespace std;

class Shape {
    
    private:
        int length;
        int width;
    
    public:
        Shape(int lenIn, int widIn);
        int area();
        int operator+(Shape shapeIn);
    
};

Shape::Shape(int lenIn, int widIn) {
    length = lenIn;
    width = widIn;
}

int Shape::area() {
    return length * width;
}

int Shape::operator+(Shape shapeIn) {
    return area() + shapeIn.area();
}

int main(int argc, char** argv) {
    Shape sh1(4, 4);
    Shape sh2(2, 6);

    int total = sh1 + sh2;

    std::cout << sh1.area() << endl;
    std::cout << sh2.area() << endl;
    std::cout << total << endl;

    return 0;
}