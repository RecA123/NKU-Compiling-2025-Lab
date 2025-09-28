#include <stdio.h>

int max(int a, int b);
int factorial(int n);

int main() {
    int a = 10;
    int b = 5;
    int result = 0;
    int i = 0;
    int n = 5;
    
    result = a + b;
    result = a - b;  
    result = a * b;
    printf("%d\n", result);
    result = a / b;
    result = a % b;

    result = a;
    result = result + 1;
    result = result * 2;
    printf("%d\n", result);
    
    if (a > b) {
        result = 1;
    } else {
        result = 0;
    }

    if (a > 0 && b > 0) {
        result = 1;
    }
    
    if (a > 0 || b > 0) {
        result = 1;
    }
    
    if (a > b) {
        result = max(a, b);
    } else if (a < b) {
        result = b;
    } else {
        result = 0;
    }

    printf("%d\n", result);
    i = 0;
    result = 0;
    while (i <= 10) {
        result = result + i;
        i = i + 1;
    }
    
    result = 0;
    for (i = 0; i < 10; i = i + 1) {
        if (i % 2 == 0) {    
            continue;
        }
        result = result + i;
        
        if (result > 20) {
            break;
        }
    }
    
    result = factorial(n);
    printf("%d\n", result);
    
    int arr[5] = {1, 2, 3, 4, 5};
    arr[0] = 10;
    result = arr[0] + arr[1];
    printf("%d\n", result);

    return 0;
}

int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

int factorial(int n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}