#include "staff.hpp"
#include "gradstudent.hpp"

class TA : public Staff, public GraduateStudent {

private:
    std::string supervisor;

public:
    void setSupervisor(std::string supervisor);
    std::string getSupervisor();
    TA();
};

TA::TA() {
    this->supervisor = "NA";
}

void TA::setSupervisor(std::string supervisor) {
    this->supervisor = supervisor;
}

std::string TA::getSupervisor() {
    return this->supervisor;
}