#include <stdio.h>
#include <stdbool.h>
#include <string.h>
 
const int n = 1000;
bool prime[n+1];
int main()
{
    int num = 0;
    memset(prime, true, sizeof(prime));
 
    for (int p = 2; p * p <= n; p++) {
        if (prime[p] == true) {
            for (int i = p * p; i <= n; i += p)
                prime[i] = false;
        }
    }
 
    for (int p = 2; p <= n; p++)
        if (prime[p])
            num++;
        printf("%d\n", num);
    return 0;
}