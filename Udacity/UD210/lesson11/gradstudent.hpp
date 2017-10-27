#include "student.hpp"

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