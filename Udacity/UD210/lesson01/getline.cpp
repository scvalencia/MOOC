#include "header.hpp"

int main(int argc, char** argv) {

    string completeName;

    cout << "How's your complete name? ";
    getline(cin, completeName);

    cout << "Thanks" << " " << completeName << ".\n";

    return 0;
}