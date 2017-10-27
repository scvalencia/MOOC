#include <iostream>
#include <string>

using namespace std;

class Student {
    string name;
    int id;
    int gradDate;

    public:
        // Mutators
        void setName(string nameIn);
        void setId(int idIn);
        void setGradDate(int gradeDateIn);
        
        // Getters
        string getName();
        int getId();
        int getGradeDate();

        // Auxiliary functions
        void print();

};

void Student::setName(string nameIn) {
    name = nameIn;
}

void Student:: setId(int idIn) {
    id = idIn;
}

void Student::setGradDate(int gradeDateIn) {
    gradDate = gradeDateIn;
}

string Student::getName() {
    return name;
}

int Student::getId() {
    return id;
}

int Student::getGradeDate() {
    return gradDate;
}

void Student::print() {
    cout << "Student(" << name << ", " << id << ", " << gradDate << ")\n";
}

int main(int argc, char** argv) {
    Student student1;

    student1.setId(1010211109);
    student1.setName("Lorena Cataro");
    student1.setGradDate(2018);

    student1.print();

    cout << student1.getGradeDate() << "\n";

    return 0;
}