#include <iostream>

using namespace std;

template <class T>
class StudentRecord {

private: 
    const int size = 5;

    int id;
    T grade;

public:
    StudentRecord(T arg);
    void setId(int id);
    void printGrades();

};

template <class T>
StudentRecord<T>::StudentRecord(T arg) {
    this->grade = arg;
}

template <class T>
void StudentRecord<T>::setId(int id) {
    this->id = id;
}

template <class T>
void StudentRecord<T>::printGrades() {
    cout << grade << endl;
}

int main(int argc, char** argv) {
    StudentRecord<int> record1 = StudentRecord<int>(9);

    record1.setId(9);
    record1.printGrades();

    StudentRecord<char> record2 = StudentRecord<char>('A');
    
    record2.setId('A');
    record2.printGrades();

    return 0;
}