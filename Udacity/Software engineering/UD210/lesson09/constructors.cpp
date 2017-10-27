#include <iostream>

class Square {

private:
    int length;
    int width;

public:
    Square();
    Square(int lenIn, int widIn);
    int getLength();
    int getWidth();
    int area();

};

Square::Square() {
    length = 0;
    width = 0;
}

Square::Square(int lenIn, int widIn) {
    length = lenIn;
    width = widIn;
}

int Square::getLength() {
    return length;
}

int Square::getWidth() {
    return width;
}

int Square::area() {
    return length * width;
}

int main(int argc, char** argv) {

    Square s1;
    Square s2(3, 4);

    std::cout << s1.area() << std::endl;
    std::cout << s2.area() << std::endl;

    return 0;
    
}