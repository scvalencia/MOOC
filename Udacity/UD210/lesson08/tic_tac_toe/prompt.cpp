/*Goal: Practice creating classes and functions. 
**Create a program that allows two users to 
**play a 4x4 tic-tac-toe game. 
*/

#include <iostream>
#include <fstream>

void getUserNames(std::string&, std::string&);
void printBlankBoard(std::string);
void printTheBoard(Board);
void printUserPrompt(std::string, char);
void printGameWinner(Board, std::string, std::string);
int  getUserResponse();
void checkResponse(Board&, char);
void writeTheBoard(Board);

void checkResponse(Board &boardIn, char input) {
    int position, userInput;

    do {

        position = getUserResponse();
        userInput = boardIn.setPosition(position, input);

        if(userInput == -1)
            std::cout << "That postition is taken.\n";

    } while(userInput == -1);

}

void getUserNames(std::string &userX, std::string &userY) {
    std::cout << "Name of user to be 'x': ";
    std::cin >> userX;

    std::cout << "Name of user to be 'o': ";
    std::cin >> userY;
}

void printBlankBoard() {
    for(int i = 0; i < 16; i++) {
        std::cout << "|" << i << ":";

        if(i <= 9) 
            std::cout << " ";
        if(i % 4 == 3) 
            std::cout << "|\n";
    }

    std::cout << "\n\n\n";
}

void printTheBoard(Board boardIn) {
    printBlankBoard();

    for(int i = 0; i < 16; i++) {
        std::cout << "|" << boardIn.getPositions()[i];
        if(i % 4 == 3)
            std::cout<<"|\n";
    }

    std::cout << "\n\n\n";
}

void writeTheBoard(Board boardIn) {
    std::cout << "\n\n";

    for(int i = 0; i < 16; i++) {
        std::cout << "|" << boardIn.getPositions()[i];

        if(i % 4 == 3)
            std::cout << "|\n";
    }

    std::cout << "\n\n\n";
}

void printUserPrompt(std::string nameIn, char letter) {
    std::cout << "\n\n";
    std::cout << nameIn << " Where would you like to place an " << letter << "?\n";
    std::cout << "Where would you like to place an " << letter << "?\n";
}

void printGameWinner(Board boardIn, std::string nameX, std::string nameO) {
    char winner = boardIn.getWinner();

    if(winner == 'x')
        std::cout << "Congrats " << nameX << " you won!\n\n";

    if(winner == 'o')
        std::cout << "Congrats " << nameO << " you won!\n\n";
    
}

int getUserResponse() {
    int position = -1;
    std::cout << "Enter an integer between 0 and 15: ";
    std::cin >> position;
    
    while(position > 15 || position < 0) {
        std::cin.clear();
        std::cout << "That is not a valid position\n";
        std::cout << "Enter an integer between 0 and 15: ";
        std::cin.clear();
        std::cin >> position;
    }

    return position;
}