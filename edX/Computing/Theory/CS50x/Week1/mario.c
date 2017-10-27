#include <stdio.h>

void printPattern1(char, int, int);
void printPattern2(char, int);

int main(void) {

	int n;
	printf("Height: ");
	scanf("%d", &n);

	int j = n - 1;
	for(int i = 0; i < n; i++) {
		printPattern1('#', j - i, i);
		printf("  ");
		printPattern2('#', i);
		printf("\n");
	}
	return 0;

}

void printPattern1(char c, int bold, int spaces) {
	for(int i = 0; i <= bold; i++)
		printf(" ");
	for(int i = 0; i <= spaces; i++)
		printf("%c", c);
}

void printPattern2(char c, int bold) {
	for(int i = 0; i <= bold; i++)
		printf("%c", c);
}