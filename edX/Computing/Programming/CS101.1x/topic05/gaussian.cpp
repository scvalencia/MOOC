#include <iostream>

int main(int argc, char** argv) {
    int i, j, k, n;
    float A[100][100], B[100], X[100];
    float divisor, factor, sum;

    std::cin >> n;

    for(int i = 0; i < n; i++)
        for(int j = 0; j < n; j++)
            std::cin >> A[i][j];

    for(int i = 0; i < n; i++)
        std::cin >> B[i];

    // ====================================================

    for(int i = 0; i < n; i++) {
        divisor = A[i][i];
        A[i][i] = 1.0;

        for(j = i + 1; j < n; j++)
            A[i][j] = A[i][j] / divisor;

        B[i] = B[i] / divisor;

        if(i + 1 < n) {
            for(k = i + 1; k < n; k++) {
                factor =  A[k][i];
                A[k][i] = 0.0;

                for(j = i + 1; j < n; j++) 
                    A[k][j] -= (factor * A[i][j]);
                
                B[k] -= factor * B[i];
            }
        }
    }

    // ====================================================

    X[n - 1] = B[n - 1];

    for(i = n - 2; i >= 0; i--) {
        sum = 0.0;

        for(j = i + 1; j < n; j++)
            sum += A[i][j] * X[j];

        X[i] = B[i] - sum;
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++)
            std::cout << A[i][j] << " ";
            std::cout << std::endl;
    }

    for(int i = 0; i < n; i++)
        std::cout << X[i] << " ";

    std::cout << std::endl;

    return 0;

}