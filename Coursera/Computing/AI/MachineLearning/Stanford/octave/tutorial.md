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
> A = [1 2; 3 4; 5 6] % A 3 x 2 matrix
A =
	1	2
	3	4
	5	6
> A = [1 2;
> 3 4;
> 5 6]
A =
	1	2
	3	4
	5	6
> v = [1 2 3]
v =
	1 2 3
> v = [1; 2; 3]
v = 
	1
	2
	3
> v = 1:0.1:2; % From 1 to 2 step is 0.1, 1 x 11 matrix
> v = 1:6
v = 
	1	2	3	4	5	6
> ones(2, 3)
ans =
	1	1	1
	1	1	1
> 2 * ones(2, 3)
ans = 
	2	2	2
	2	2	2
> w = ones(1, 3)
ans =
	1	1	1
> w = zeros(1, 3)
ans =
	0	0	0
> w = rand(1, 3)
w =
	0.23423		0.74654		0.45353
> w = rand(3, 3) % A 3 x 3 matrix of random numbers
w =

   0.645383   0.931521   0.907276
   0.037238   0.967285   0.733113
   0.791088   0.010620   0.602092
> w = randn(1, 3) % Normal distribution random numbers
w =

   0.0077647  -0.8431902   1.2142484
> 6 + ones(1,3)
ans =

   7   7   7
> w = sqrt(10) * randn(1,5);
> 6 + w
ans =

   10.8879    8.1821    4.9628    3.1724   11.8588
> w = 6 + sqrt(10)*(randn(1,100000));
> hist(w, 50)
![](https://raw.githubusercontent.com/scvalencia/MOOC/master/Coursera/Computing/AI/MachineLearning/Stanford/octave/img/normal_histogram.png)
```


