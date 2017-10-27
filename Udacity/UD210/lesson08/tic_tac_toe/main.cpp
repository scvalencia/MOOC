#include "board.cpp"
#include "prompt.cpp"

using namespace std;

int main(int argc, char** argv) {
    Board board;
    std::string nameX, nameO;

    int tieGame = 0, numTurns = 0;
    char gameWinner = 'z';

    getUserNames(nameX, nameO);

    while(numTurns < 8) {
        printTheBoard(board);

        printUserPrompt(nameX, 'x');
        checkResponse(board, 'x');

        gameWinner = board.getWinner();

        if(gameWinner != 'z') {
            printTheBoard(board);
            writeTheBoard(board);
            printGameWinner(board, nameX, nameO);
            break;
        }

        printTheBoard(board);
        writeTheBoard(board);

        printUserPrompt(nameO, 'o');
        checkResponse(board, 'o');

        printTheBoard(board);
        writeTheBoard(board);

        if(gameWinner != 'z') {
            printTheBoard(board);
            writeTheBoard(board);
            printGameWinner(board, nameX, nameO);
            break;
        }

        numTurns++;
    }
    
}