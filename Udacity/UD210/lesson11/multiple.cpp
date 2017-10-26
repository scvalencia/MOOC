#include <iostream>
#include <string>
#include "ta.hpp"

int main(int argc, char** argv) {

    TA ta;

    ta.setId(55555);
    ta.setDegree("PhD CS");
    ta.setTitle("Research assistant");
    ta.setSupervisor("Nicolas Cardozo");

    std::cout << ta.getId() << " - " << ta.getDegree() << " - ";
    std::cout << ta.getTitle() << " - " << ta.getSupervisor();;
    std::cout << std::endl;

    return 0;
}