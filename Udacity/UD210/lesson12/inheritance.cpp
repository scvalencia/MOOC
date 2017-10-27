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
    float calcWeeklyPay();
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

void issue() {

    Employee e1;
    Manager m1;

    e1.setPayRate(10.00);
    m1.setPayRate(12000.00);

    std::cout << "e1 pay: $" << e1.calcWeeklyPay() << std::endl;
    std::cout << "m1 pay: $" << m1.calcWeeklyPay() << std::endl;

}

void ptrSolution() {

    /* 
     * Does not work, since the type of e1 is statically bound during 
     * compile time, while we want it to be dinamically bound
    */

    
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

}

int main(int argc, char** argv) {

    //issue();
    ptrSolution();

    return 0;
}