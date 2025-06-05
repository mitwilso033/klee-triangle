#include <stdio.h>

void triangle(int a, int b, int c) {
	    if ((a + b > c) && (a + c > b) && (b + c > a)) {
		            if (a == b || a == c || b == c) {
				                if (a == b && a == c)
							                printf("equilateral triangle.\n");
						            else
								                    printf("isosceles triangle.\n");
							            } else {
									                printf("triangle.\n");
											        }
			        } else {
					        printf("non-triangle.\n");
						    }
}

