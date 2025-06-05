#include <stdio.h>
#include <stdlib.h>

extern void triangle(int a, int b, int c);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s a b c\n", argv[0]);
        return 1;
    }

    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    int c = atoi(argv[3]);

    triangle(a, b, c);

    return 0;
}
