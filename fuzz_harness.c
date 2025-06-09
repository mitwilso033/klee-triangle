#include <stdio.h>
#include <stdlib.h>
#include <string.h> // Required for strtok

// The triangle function from your assignment
void triangle(int a, int b, int c) {
    if ((a + b > c) && (a + c > b) && (b + c > a)) {
        if (a == b || a == c || b == c) {
            if (a == b && a == c) {
                printf("equilateral triangle.\n");
            } else {
                printf("isosceles triangle.\n");
            }
        } else {
            printf("triangle.\n");
        }
    } else {
        printf("non-triangle.\n");
    }
    return;
}

int main(int argc, char *argv[]) {
    // AFL++ persistent mode loop for efficiency
    #ifdef __AFL_LOOP
    while (__AFL_LOOP(1000)) { // Loop up to 1000 times without execve()
    #endif

        // Read input from stdin (AFL++ feeds data here)
        char buffer[256]; // Max input size
        if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
            // If input is empty or error, continue
            #ifdef __AFL_LOOP
            continue;
            #else
            return 1;
            #endif
        }

        // Parse the input (expecting three space-separated integers)
        int a, b, c;
        char *token;

        token = strtok(buffer, " \n\r");
        if (token == NULL) { /* Handle empty input */
            #ifdef __AFL_LOOP
            continue;
            #else
            return 1;
            #endif
        }
        a = atoi(token);

        token = strtok(NULL, " \n\r");
        if (token == NULL) { /* Handle missing second number */
            #ifdef __AFL_LOOP
            continue;
            #else
            return 1;
            #endif
        }
        b = atoi(token);

        token = strtok(NULL, " \n\r");
        if (token == NULL) { /* Handle missing third number */
            #ifdef __AFL_LOOP
            continue;
            #else
            return 1;
            #endif
        }
        c = atoi(token);

        // Call the function under test
        triangle(a, b, c);

    #ifdef __AFL_LOOP
    }
    #endif

    return 0;
}