#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
    printf("argc: %d\n", argc);
    printf("argv[0]: %s\n", argv[0]);
    printf("argv[1]: %s\n", argv[1]);
    if (argc != 3) {
        perror("Provide all arguments");
        return 1;
    }
    if (argv[0][0] == '\0') {
        perror("File name must not be empty");
        return 1;
    }
    if (argv[1][0] == '\0') {
        perror("Date must not be empty");
        return 1;
    }
    if (strlen(argv[1]) != 10) {
        perror("Date must be 10 characters long");
        return 1;
    }
    if (argv[1][4] != '-' || argv[1][7] != '-') {
        perror("Date must be in the format YYYY-MM-DD");
        return 1;
    }
    if (argv[1][0] < '0' || argv[1][0] > '9' ||
        argv[1][1] < '0' || argv[1][1] > '9' ||
        argv[1][2] < '0' || argv[1][2] > '9' ||
        argv[1][3] < '0' || argv[1][3] > '9' ||
        argv[1][5] < '0' || argv[1][5] > '9' ||
        argv[1][6] < '0' || argv[1][6] > '9' ||
        argv[1][8] < '0' || argv[1][8] > '9' ||
        argv[1][9] < '0' || argv[1][9] > '9') {
        perror("Date must be in the format YYYY-MM-DD");
        return 1;
    }
    if (argv[1][5] != '0' && argv[1][5] != '1') {
        perror("Month must be between 01 and 12");
        return 1;
    }
    // Open the file in read-write mode
    FILE *file = fopen(argv[0], "r+");
    if (file == NULL) {
        perror("Failed to open file");
        return 1;
    }

    // Read the header of the file
    char header[56];
    if (fgets(header, sizeof(header), file) == NULL) {
        perror("Failed to read header");
        fclose(file);
        return 1;
    }

    // Manipulate the header as needed
    // For example, replace "old" with "new"
    //Take input
    char *old = "001|";
    char *date = "argv[1]";
    char new[14]="";
    char *pos = strstr(header, old);
    printf("pos: %s\n", pos);
    printf("old: %s\n", old);
    strcpy(new,old);
    printf("new: %s\n", new);
    strcat(new,date);
    printf("new: %s\n", new);
    if (pos != NULL) {
        strncpy(pos, new, strlen(new));
        
    }

    // Write the modified header back to the file
    if (fseek(file, 0, SEEK_SET) != 0) {
        perror("Failed to seek to beginning of file");
        fclose(file);
        return 1;
    }
    if (fputs(header, file) == EOF) {
        perror("Failed to write header");
        fclose(file);
        return 1;
    }

    // Close the file
    if (fclose(file) != 0) {
        perror("Failed to close file");
        return 1;
    }

    return 0;
}