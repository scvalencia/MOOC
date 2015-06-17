#include <stdio.h>

typedef struct {
    float center[3];
    float radius;
} Sphere;

typedef struct {
    char name[100];
    float salary;
} Employee;

int getAge();
void solve();
Sphere makeSphere(float *c, float r);

int main() {
    
    float centerVar[] = {1.0, 2.0, 3.0, 4.0};
    float radiusVar = 9.0;
    
    Sphere ball = makeSphere(centerVar, radiusVar);
    printf("Ball: (x, y, z) = (%f, %f, %f); c = %f\n", ball.center[0],
           ball.center[1], ball.center[2], ball.radius);
    
    
    
    char* letter;
    char f = 'k';
    letter = &f;
    printf("%c is always the same as %c\n", f, *letter);
    f = 'q';
    printf("%c is always the same as %c\n", f, *letter);
    f = 't';
    printf("%c is always the same as %c\n", f, *letter);
    
    char eldridge[] = "eldridge";
    letter = &eldridge[0];
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    ++letter;
    printf("%c is in %s\n", *letter, eldridge);
    
    float numbers[3] = {3.14156, 1.6180, 1.4142};
    printf("%ld\n", sizeof(numbers)/sizeof(float));
    int a = 9, b = 9;
    int c = ++a;
    int d = b++;
    printf("a %d c %d d %d\n", a, c, d);


    // insert code here...
    printf("Hi, tell me your name: ");
    char name[100];
    scanf("%s", name);
    printf("Well done %s, tell me your age: ", name);
    int age = getAge();
    printf("Dr. %s, you have %d years old.\n", name, age);
    printf("%f\n", numbers[0]);
    printf("%f\n", numbers[1]);
    printf("%f\n", numbers[2]);
    int i = 0;
    for(; i < 10; i++)
        printf("Hello Motherfucker\n");
    solve();
    return 0;
}

int getAge() {
    int age;
    scanf("%d", &age);
    return age;
}

void solve() {
    int n;
    scanf("%d", &n);
    int i = 0, flag = 0, sum = 0;
    for(; i < n; i++) {
        scanf("%d", &flag);
        sum += flag;
    }
    printf("%d\n", sum);
}

Sphere makeSphere(float *c, float r) {
    Sphere ans;
    ans.center[0] = c[0];
    ans.center[1] = c[1];
    ans.center[2] = c[2];
    ans.radius = r;
    return ans;
}