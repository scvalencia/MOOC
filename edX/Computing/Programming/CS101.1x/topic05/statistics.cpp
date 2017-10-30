#include <iostream>
#include <cmath>

void stats() {

    int max, min, sum = 0;
    float avg, std;
    
    int data[500], n;

    std::cin >> n;

    for(int i = 0; i < n; i++)
        std::cin >> data[i];

    max = data[0];
    min = data[0];

    for(int i = 0; i < n; i++) {
        int current = data[i];
        
        if(current < min)
            min = current;
        if(current > max)
            max = current;

        sum += current;
    }

    avg += (sum + 0.0) / n;
    
    for(int i = 0; i < n; i++) {
        float diff = data[i] - avg;
        std += pow(diff, 2);
    }

    std = sqrt(std / n);

    std::cout << "SUM: " << sum << std::endl;
    std::cout << "MIN: " << min << std::endl;
    std::cout << "MAX: " << max << std::endl;
    std::cout << "AVG: " << avg << std::endl;
    std::cout << "STD: " << std << std::endl;
    
}

int main(int argc, char** argv) {
    stats();
    return 0;
}