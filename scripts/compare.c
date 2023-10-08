/**
 * Compares two files line by line and prints the differences.
 * 
 * @param argc The number of command line arguments.
 * @param argv The array of command line arguments.
 * @return 0 if the files are identical, 1 otherwise.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 1000

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s file1 file2\n", argv[0]);
        return 1;
    }

    FILE *file1 = fopen(argv[1], "r+b");
    if (file1 == NULL) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    FILE *file2 = fopen(argv[2], "r+b");
    if (file2 == NULL) {
        printf("Error: Could not open file %s\n", argv[2]);
        fclose(file1);
        return 1;
    }

    char line1[MAX_LINE_LENGTH];
    char line2[MAX_LINE_LENGTH];
    int lineNum = 1;
    int differentLines = 0;

    while (fgets(line1, MAX_LINE_LENGTH, file1) != NULL && fgets(line2, MAX_LINE_LENGTH, file2) != NULL) {
        if (strcmp(line1, line2) != 0) {
            printf("Line %d is different:\n%s%s", lineNum, line1, line2);
            differentLines++;
        }
        lineNum++;
    }

    if (fgets(line1, MAX_LINE_LENGTH, file1) != NULL) {
        printf("File %s has more lines than file %s\n", argv[1], argv[2]);
        differentLines++;
    }

    if (fgets(line2, MAX_LINE_LENGTH, file2) != NULL) {
        printf("File %s has more lines than file %s\n", argv[2], argv[1]);
        differentLines++;
    }

    if (differentLines == 0) {
        printf("The files are identical\n");
    } else {
        printf("There are %d different lines\n", differentLines);
    }

    fclose(file1);
    fclose(file2);
    return 0;
}