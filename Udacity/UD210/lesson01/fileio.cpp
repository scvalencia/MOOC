#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>

using namespace std;
int main(int agrc, char** argv) {

    /*
     * Steps for file IO
     * 1. include <fstream> library
     * 2. Create stream (input, output, both)
     *  - ofstream myFile (for wrirting to a file)
     *  - ifstream myfile (for reading a file)
     *  - fstream myfile (reading and writing a file)
     * 3. Open the file myfile.open("filename")
     * 4. Write or read the file
     * 5. Close the file myfile.close()
    */

    string line;

    ifstream inputFileObject ("text.in");
    ofstream outputFileObject ("text.out", ios::app);
    
    if(outputFileObject.is_open() && inputFileObject.is_open()) {
        cout << "Processing files" << "\n";

        while(getline(inputFileObject, line)) {
            outputFileObject << line << "\n\n";
        }

        inputFileObject.close();
        outputFileObject.close();
    }

    else
        cout << "Unable to process files" << "\n";

    return 0;

}