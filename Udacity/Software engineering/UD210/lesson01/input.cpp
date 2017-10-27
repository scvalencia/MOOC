#include "header.hpp"

int main(int argc, char** argv) {

    string name, completeName;
    int favouriteYear;

    cout << "Hi, what's your name?" << " ";
    cin >> name;

    cout << "Ok " << name << " " << "Tell us abaout your favourite year: ";
    cin >> favouriteYear;

    cout << "User " << name << " " << "told us, his/hers fav year is " << favouriteYear << "\n";

    cout << "\n\n";

    cout << "Ok " << name << " how's your complete name";
    getline(cin, completeName);

    return 0;
}