# Submissions

### What to Submit

A solution for every problem is a single source file (for instance, **a.cpp** or **Main.java**). Please do not submit examples of input/output files, compiled executables, archives, as these will be not accepted for judging.

We determine the programming language by the extension of the source file name. The mappings are:

* ***.cpp**: MinGW C++, version 4.9.2;
* ***.java**: Oracle Java, version 1.8.0_91.

### Input/Output

The solution should read the input data from the input file (with the name which is specified in the problem statement). It should also write the output data to the output file (also specified in the problem statement). For example, for the "A + B" problem, the input file is said to be **aplusb.in**, and the output file is **aplusb.out**. The following properties will hold:

* Both input and output file names are related to the current directory of your program.
* The input file will exist and will be available for reading. Additionally, its format is guaranteed to satisfy the requirements, which are specified in the statement. No checking of the format is necessary in your program, although if you perform it, it is OK, unless it seriously influences the program's speed.
* The output file will not exist when your program starts, but your program will have enough rights to create it and write to it. Please follow the output file format described in the problem statement.

There are assumptions about the input and output files which you are welcome to use:

* If not stated otherwise, all lines in the input file have neither leading nor trailing nor duplicated spaces. Every line, including the last one, is ended with a Windows end-of-line symbol sequence.
* If not stated otherwise, separate the tokens (numbers or words) in the output file by single space, and also try not to issue leading or trailing spaces. Checkers, however, are quite tolerable to minor spacing issues, including Linux/Windows line terminators. However, if the problem statement requires you to carefully follow the output format (this usually follows from explicit words, as well as verbose and/or structured output), please do adhere to the format.

### How testing system works

First, your program is compiled using the compiler determined by the extension of the source file. If compilation fails, you will receive the **Compilation Error** outcome, and first few lines of the compiler's output. This will help you to understand why your code cannot be compiled.

After that, it will be tested on several tests (typically tens to few hundreds. During execution, **time and memory limits**, specified in the problem statement, will be enforced on your program. More precisely, the following will happen:

1. The current directory is cleaned up, such that only the program's executable file remains in it.
2. The input file, belonging to the current test, is copied to the current directory.
3. The program is executed under the control of software (the "sandbox"), which checks whether time, memory and other limits are exceeded. During this execution, the following things may happen: 
	* If, at a certain point of time, the program exceeds the memory limit (it is the **resident set size** that counts), the execution is terminated, and the **Memory Limit Exceeded, test #XX** outcome is reported, where XX is the number of the current test.
	* If, at a certain point of time, the program tries to open network connections, create graphical interface, or do similar things that it should not do, the execution is terminated, and the **Security Violation, test #XX** outcome is reported, where XX is the number of the current test.
	* If, at a certain point of time, the program encountered a runtime error (such as wrong memory access, division by zero, or throwing an exception) the **Runtime Error, test #XX** outcome is reported, where XX is the number of the current test.
	* If the program exceeds the time limit (user time and system time are summed up), the execution is terminated, and the **Time Limit Exceeded, test #XX** outcome is reported, where XX is the number of the current test.
	* If the program consumes too few processor resources (that is, its processor usage is less than 0.1 for at least 10 seconds), the execution is terminated, and the **Idleness Limit Exceeded, test #XX** outcome is reported, where XX is the number of the current test.** This typically means that the program expects some input from the console**, which is not needed, as input is file-based.
4. If the program successfully terminates, its output is validated by the special checker program. The following outcomes may happen: 
	* **Presentation Error, test#XX**. Either the output file does not exist (check the name of the output file!), or something has been written to it which cannot be interpreted by a checker. Examples include non-number data where number is expected, or insufficient data written, or extra data written.
	* **Wrong Answer, test#XX**. The output file was interpreted by the checker and found to be incorrect. The reasons may vary; the typical ones are: wrong numbers or strings are written, the answer is not optimal, the answer certificate does not correspond to the answer.
	* The checker finds the output file to be correct. In this case, the evaluation continues with the next test in order. 
If for all tests the corresponding output files were correct, the Accepted outcome is reported. This means you have solved this problem. 