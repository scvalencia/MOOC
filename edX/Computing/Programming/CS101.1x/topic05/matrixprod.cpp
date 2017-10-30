#include <iostream>

int main(int argc, char** argv) {
    int A[100][100];
    int B[100][100];
    int C[100][100];

    int arows, acols;
    int brows, bcols;

    std::cin >> arows >> acols;
    std::cin >> brows >> bcols;

    if(acols != brows) {
        std::cout << "The dimensions of the matrix must be n x m and m x l to produce one of dim n x l";
        return 0;
    }

    for(int i = 0; i < arows; i++)
        for(int j = 0; j < acols; j++)
            std::cin >> A[i][j];

    for(int i = 0; i < brows; i++)
        for(int j = 0; j < bcols; j++)
            std::cin >> B[i][j];

    int crows = arows;
    int ccols = bcols;
    int shared = acols; // or brows

    for(int i = 0; i < crows; i++) {
        for(int j = 0; j < ccols; j++) {
            C[i][j] = 0;
            for(int k = 0; k < shared; k++) 
                C[i][j] += A[i][k] * B[k][j]; 
        }
    }

    for(int i = 0; i < crows; i++) {
        for(int j = 0; j < ccols; j++)
            std::cout << C[i][j] << " ";
            std::cout << std::endl;
    }

}