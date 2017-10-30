#include <iostream>

void sum4() {
    int a, b, c, d;

    std::cin >> a >> b >> c >> d;
    std::cout << a + b + c + d << std::endl;
}

void sum7() {
    int a, b, c, d, e, f, g;

    std::cin >> a >> b >> c >> d >> e >> f >> g;
    std::cout << a + b + c + d + e + f + g << std::endl;
}

void sumn(int n) {
    int sum = 0, current;

    for(int i = 0; i < n; i++) {
        std::cin >> current;
        sum += current;
    }

    std::cout << sum << std::endl;
}

void sum_fixed_array() {
    int nums[500], n, sum = 0;

    std::cin >> n;

    for(int i = 0; i < n; i++) {
        std::cin >> nums[i];
        sum += nums[i];
    }

    int max = nums[0], min = nums[0];

    for(int i = 0; i < n; i++) {
        if(nums[i] < min)
            min = nums[i];
        if(nums[i] > max)
            max = nums[i];
    }

    std::cout << "SUM: " <<  sum << std::endl;
    std::cout << "MIN: " <<  min << std::endl;
    std::cout << "MAX: " <<  max << std::endl;

}

int main(int argc, char** argv) {
    //sum4();
    //sum7();
    //sumn(8);

    /* We need to store them to be able to compute several
     * statistics, or sort the numbers. Arrays provide a
     * single name for a whole collection
    */

    sum_fixed_array();

    return 0;
}