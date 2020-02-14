#include <stdio.h>
#include <stdlib.h>

int powF(int base, int pow) {
    if (pow != 0) {
        return (base * powF(base, pow - 1));
    }
    else {
        return 1;
    }
}

int main(int argc, char **argv) {
    if (argc < 3) {
      printf("%s usage: [BASE] [POWER]\n", argv[0]);
    return 1;
    }
    int base = atoi(argv[1]);
    int pow = atoi(argv[2]);
    int recur = powF(base, pow);
    printf("%d\n", recur);
    return 0;
}
