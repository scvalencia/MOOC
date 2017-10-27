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