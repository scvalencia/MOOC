#include <iostream>
#include <string>

class Student {
private:
    int id;

public:
    void setId(int id);
    int getId();
    Student();
};

Student::Student() {
    this->id = 100000000;
}

void Student::setId(int id) {
    this->id = id;
}

int Student::getId() {
    return this->id;
}

class GraduateStudent : public Student {
private:
    std::string degree;

public:
    void setDegree(std::string degree);
    std::string getDegree();
    GraduateStudent();
};

GraduateStudent::GraduateStudent() {
    this->degree = "undeclared";
}

void GraduateStudent::setDegree(std::string degree) {
    this->degree = degree;
}

std::string GraduateStudent::getDegree() {
    return this->degree;
}

int main(int argc, char** argv) {

    GraduateStudent gs1;

    gs1.setId(42543554);
    gs1.setDegree("BSEE");

    std::cout << gs1.getId() << " " << gs1.getDegree() << std::endl;

    return 0;
}
