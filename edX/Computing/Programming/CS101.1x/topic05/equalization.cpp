#include <iostream>
#include <cmath>

#define BOUND 100
#define IMG_RANGE 255

int main(int argc, char** argv) {
    int image[BOUND][BOUND];

    int width, height;

    std::cin >> width >> height;

    for(int i = 0; i < height; i++)
        for(int j = 0; j < width; j++)
            std::cin >> image[i][j];

    int histogram[IMG_RANGE + 1];
    int cdf[IMG_RANGE + 1];

    for(int i = 0; i < IMG_RANGE + 1; i++) {
        histogram[i] = 0;
        cdf[i] = 0;
    }

    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            int value = image[i][j];
            histogram[value] += 1;
        }
    }

    cdf[0] = histogram[0];

    int cdf_min = IMG_RANGE;

    for(int i = 1; i < IMG_RANGE + 1; i++) {
        cdf[i] = histogram[i] + cdf[i - 1];

        if(cdf[i] < cdf_min && cdf[i] != 0)
            cdf_min = cdf[i];
    }

    for(int i = 0; i < IMG_RANGE + 1; i++) {
        int numerator = cdf[i] - cdf_min;
        int denominator = (width * height) - cdf_min;
        float ratio = ((float) numerator) / ((float) denominator);
        ratio *= (IMG_RANGE + 1 - 1);

        int value = round(ratio);

        histogram[i] = (value < 0) ? 0 : value;
    }

    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            image[i][j] = histogram[image[i][j]];
            std::cout << image[i][j] << " ";
        }
        std::cout << std::endl;
    }

    return 0;
}