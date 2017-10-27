#include <iostream>
#include <stdio.h>

int main(int argc, char** argv) {
    int userInput = 0, maxNumber = 0, minNumber = 100, sumTotal = 0;
    float average = 0;
    
    //get the numbers from the user
    for(int i = 0; i < 15; i++) {

        std::cout << "Enter a number: ";
        scanf("%d", &userInput);

        std::cout << userInput << "\n";
        
        if(userInput > maxNumber)
            maxNumber = userInput;

        if(userInput < minNumber)
            minNumber = userInput;
        
        sumTotal = sumTotal + userInput;
    }

    std::cout << "Maximum number = " << maxNumber << "\n";
    std::cout << "Minimum number = " << minNumber << "\n";
    average = sumTotal / 15;
    std::cout << "Average = " << average << "\n";
    
    return 0;
}