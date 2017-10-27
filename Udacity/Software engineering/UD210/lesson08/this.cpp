#include <iostream>

using namespace std;

class Shape {
    int length;
    int width;

    public:

        Shape(int l = 2, int w = 2) {
            length = l;
            width = w;
        }

        double area() {
            return length * width;
        }

        int compareWithThis(Shape shape) {
            return this->area() > shape.area();
        }

        int compare(Shape shape) {
            return area() > shape.area();
        }

};

int main(int argc, char** argv) {
    Shape sh1(4, 4);
    Shape sh2(2, 6);

    if(sh1.compare(sh2))
        cout << "Shape2 is smaller than Shape1" << endl;
    else
        cout << "Shape1 is smaller than Shape2" << endl;

    
    if(sh1.compareWithThis(sh2))
        cout << "Shape2 is smaller than Shape1" << endl;
    else
        cout << "Shape1 is smaller than Shape2" << endl;

    
    return 0;

}
