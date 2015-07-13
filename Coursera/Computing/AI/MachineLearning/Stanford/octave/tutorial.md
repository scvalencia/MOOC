## Octave tutorial

### Basic operations.

```matlab
> 5 + 6
ans = 11
> 3 - 2
ans = 1
> 5 * 8
ans = 40
> 1/2
ans = 0.5000
> 2 ^ 6
ans = 64
> 1 == 2 % false
ans = 0
> 1 ~= 2
ans = true
> 1 && 0
ans = 0
> 1 || 0
ans = 1
> xor(1, 0)
ans = 1
> PS('>> '); % Change prompt (Octave command prompt)
> a + 3; % a semicolon, ommits computation being displayed
> b = 'hi';
> b
b = 'hi'
> pi
3.1416
> a = pi
> disp(a);
 3.1416
> disp(sprintf('2 decimals: %0.2f', a)) % As in C format print IO
2 decimals: 3.14
> format long % More decimal places to print
> A = [1 2; 3 4; 5 6] % A 2 x 3 matrix
A =
	1	2
	3	4
	5	6
> A = [1 2;]
```


