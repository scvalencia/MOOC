class Board {
    char positionsSelected[16];
    char winner;

    public:

        Board() {
            winner = 'z';

            for(int i = 0; i < 16; i++)
                positionsSelected[i] = '_';
        }

        char* getPositions(void);
        char getWinner(void);
        int setPosition(int gridNumber, char user);

    private:

        char checkRows();
        char checkColumns();
        char checkLeftDiagonal();
        char checkRightDiagonal();
        char checkDiagonals();
};