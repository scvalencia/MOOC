#include <iostream>
#include <string>

class Employee {
private:
    float payRate;
    std::string name;
    int employeeNumber;
public:
    void setPayRate(float rate);
    float getPayRate();
    virtual float calcWeeklyPay();
};

void Employee::setPayRate(float rate) {
    this->payRate = rate;
}

float Employee::getPayRate() {
    return this->payRate;
}

float Employee::calcWeeklyPay() {
    return 40 * this->payRate;
}

class Manager : public Employee {
public:
    float calcWeeklyPay();
};

float Manager::calcWeeklyPay() {
    return this->getPayRate() / 52;
}

int main(int argc, char** argv) {

    const std::string status = "salary";
    std::string level = "hourly";

    Employee* e1;

    if(status == level)
        e1 = new Employee();
    else
        e1 = new Manager();

    e1->setPayRate(12000.00);
    std::cout << "e1 pay: $" << e1->calcWeeklyPay() << std::endl;

    delete e1;

    return 0;
}