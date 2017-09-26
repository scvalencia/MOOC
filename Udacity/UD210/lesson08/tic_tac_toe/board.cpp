#include "board.hpp"

char* Board::getPositions(void) {
    return positionsSelected;
}

int Board::setPosition(int gridNumber, char user) {
    if(positionsSelected[gridNumber] == '_') {
        positionsSelected[gridNumber] = user;
        return 0;
    }

    return -1;

}

char Board::checkRows() {
    for(int row = 0; row < 16; row += 4) {
        int xcount = 0, ocount = 0;

        for(int col = row; col < row + 4; col++) {
            switch(positionsSelected[col]) {
                case 'x':
                    xcount++;
                case 'o':
                    ocount++;
            }
        }

        if(xcount == 4) {
            winner = 'x';
            return 'x';
        } else if(ocount == 4) {
            winner = 'o';
            return 'o';
        }

    }

    return 'z';

}

char Board::checkColumns() {
    for(int col = 0; col < 4; col ++) {
        int xcount = 0, ocount = 0;

        for(int row = col; row <= col + 12; row += 4) {
            switch(positionsSelected[row]) {
                case 'x':
                    xcount++;
                case 'o':
                    ocount++;
            }
        }

        if(xcount == 4) {
            winner = 'x';
            return 'x';
        } else if(ocount == 4) {
            winner = 'o';
            return 'o';
        }

    }

    return 'z';

}

char Board::checkLeftDiagonal() {
    int xcount = 0, ocount = 0;
    for(int i = 0; i < 16; i += 5) {
        switch(positionsSelected[i]) {
            case 'x':
                xcount++;
            case 'o':
                ocount++;
        }
    }

    if(xcount == 4) {
        winner = 'x';
        return 'x';
    } else if(ocount == 4) {
        winner = 'o';
        return 'o';
    }

    return 'z';

}

char Board::checkRightDiagonal() {
    int xcount = 0, ocount = 0;
    for(int i = 3; i < 13; i += 3) {
        switch(positionsSelected[i]) {
            case 'x':
                xcount++;
            case 'o':
                ocount++;
        }
    }

    if(xcount == 4) {
        winner = 'x';
        return 'x';
    } else if(ocount == 4) {
        winner = 'o';
        return 'o';
    }

    return 'z';

}

char Board::checkDiagonals() {
    char leftDiagonal = checkLeftDiagonal();
    char rightDiagonal = checkRightDiagonal();

    if(leftDiagonal != 'z')
        return leftDiagonal;
    else if(rightDiagonal != 'z')
        return rightDiagonal;
    else
        return 'z';

}

char Board::getWinner() {
    char winner = 'z';

    winner = checkRows();

    if(winner == 'z')
        winner = checkColumns();
    if(winner == 'z')
        winner = checkDiagonals();

    return winner;
}