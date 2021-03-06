#include <iostream>
#include <vector>

int main(int agrc, char** argv) {
    std::vector<int> numbers;
    std::vector<int>:: iterator it;

    std::cout << "The size of numbers is: " << numbers.size() << std::endl;
    std::cout << "==================================================" << std::endl;

    numbers.resize(10);
    std::cout << "The size of numbers is: " << numbers.size() << std::endl;
    std::cout << "==================================================" << std::endl;

    numbers.assign(4, 3);

    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;

    std::cout << "==================================================" << std::endl;

    numbers.resize(10);

    int i = 0;
    for(it = numbers.begin(); it != numbers.end(); it++, i++) {
        *it = i;
        std::cout << *it << std::endl;
    }

    numbers.push_back(23);
    numbers.push_back(24);
    numbers.push_back(25);
    numbers.push_back(26);
    numbers.push_back(27);
    numbers.push_back(28);
    numbers.push_back(29);

    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;

    std::cout << "==================================================" << std::endl;

    it = numbers.begin();
    numbers.insert(it + 3, 100);

    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;

    std::cout << "==================================================" << std::endl;

    it = numbers.begin();
    numbers.erase(it + 7);
    
    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;
    
    std::cout << "==================================================" << std::endl;

    it = numbers.begin();
    numbers.erase(it + 7, it + 10);
    
    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;
    
    std::cout << "==================================================" << std::endl;

    numbers.pop_back();
    
    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;
    
    std::cout << "==================================================" << std::endl;

    numbers.clear();

    for(it = numbers.begin(); it != numbers.end(); it++)
        std::cout << *it << std::endl;

    std::cout << "==================================================" << std::endl;

    return 0;
}