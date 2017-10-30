#include <iostream>

int main(int argc, char** argv) {
    int matrix[3][3];

    for(int i = 0; i < 3; i++)
        for(int j = 0; j < 3; j++)
            std::cin >> matrix[i][j];

    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++)
            std::cout << matrix[i][j] << " ";
            std::cout << std::endl;
    }

}