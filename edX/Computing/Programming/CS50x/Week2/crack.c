#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

int main(int argc, char *argv[]) {	

	if(argc != 2 || (strlen(argv[1]) != 13))
		return 1;

	char* user = argv[1];

	FILE *ptr_file = fopen("passwords.txt", "r");
	char buf[1000];

	while (fgets(buf, 1000, ptr_file) != NULL) {

		int posDoubleDot;
		for(int i = 0; i < strlen(buf); i++) 
			if(buf[i] == ':')
				posDoubleDot = (i + 1);

		char temp[strlen(user)];

		for(int i = 0; i < strlen(user); i++)
				temp[i] = ' ';

		for(int i = 0; i < strlen(user); i++) 
			temp[i] = buf[posDoubleDot + i];

		if(strcmp(user, temp) == 0) {
			for(int i = 0; i < posDoubleDot - 1; i++) 
				printf("%c", buf[i]);
			printf("\n");
		}		
	}
	
	fclose(ptr_file);
	return 0;
}