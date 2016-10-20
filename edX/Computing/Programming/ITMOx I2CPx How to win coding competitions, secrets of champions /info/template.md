# Template for Submissions

### C++

For compiling C++ solutions (source file extension ***.cpp**), the MinGW 32-bit C++ compiler is used (version 4.9.2). Your submission will be compiled as follows:

`g++ -DJUDGE -std=gnu++11 -x c++ --static -O2 -Wl,--stack=67108864 [source-file] -o FastHeap.exe`

where [source-file] is the name of your source file. In other words, you will have C++11 features available, code optimized, and 64 megabytes of stack. The `FastHeap.exe` file name is chosen due to the issues with MinGW standard library: when it detects it is running under supervision, it switches to debug STL libraries, which, in certain cases, may degrade asymptotically. A registry patch fixes this behaviour, but only to executables with a certain name.

A preprocessor variable named `JUDGE` is defined for you, such that you may switch on or off some code, based on whether your solution is compiled on the testing server. One of the way to use this feature is demonstrated in the example problem solution below.

#### Example solution

This code solves the "A + B" problem. If it is compiled on the testing server, it uses the input/output files, otherwise it reads from standard input and writes to standard output. However, **you don't have to follow this pattern**, or to use code from this example solution.

```c
#ifdef JUDGE
#include <fstream>
std::ifstream cin("aplusb.in");
std::ofstream cout("aplusb.out");
#else
#include <iostream>
using std::cin;
using std::cout;
#endif
  
int main() {
    int a, b;
    cin >> a >> b;
    cout << a + b << std::endl;
    return 0;
}
```

### Java

For compiling and running submissions in Java (source file extension ***.java**, a 64-bit version of Oracle JDK 1.8.0_91 is used.

Compilation is performed by a special wrapper around the Java compiler, which detects the **public class** with the `public static void main(String[])` method and setups everything to run precisely this class. However, for all basic usages it is equivalent to the following (Unix flavoured) command:

`javac [source-file] && jar -cfe [source-file-noext].jar [class-with-main-file] *.class`

for the main class in the root (empty) package, or

`javac [source-file] && mkdir -p [package-structure] && mv *.class [package-structure] && jar -cfe [source-file-noext].jar [class-with-main-file] [first-package-component]`

for the main class in a non-empty package. In both examples, [source-file] is the name of your source file, [source-file-noext] is the same name without the ***.java** extension, [class-with-main-file] is the name of the class containing the main file, [package-structure] is the package which is declared in the source file with dots replaced by slashes, [first-package-component] is the first component of the package (e.g. x for package x.y.z).

Running of the code is performed equivalently to the following:

`java -DJUDGE -Xss64M -Xmx256M -jar [source-file-noext].jar`

which means that you have at most 256 megabytes of memory (for everything include running code from standard libraries). An environment variable `JUDGE` is defined for you such that you may do this or that, based on whether your solution is running on the testing server. One of the way to use this feature is demonstrated in the example problem solution below.

#### Example solution

This code solves the "A + B" problem. If it is compiled on the testing server, it uses the input/output files, otherwise it reads from standard input and writes to standard output. However, **you don't have to follow this pattern**, or to use code from this example solution.

```java
package x.y.z;

import java.io.*;
import java.util.*;

public class Main {
    static Scanner newInput() throws IOException {
        if (System.getProperty("JUDGE") != null) {
            return new Scanner(new File("aplusb.in"));
        } else {
            return new Scanner(System.in);
        }
    }
    static PrintWriter newOutput() throws IOException {
        if (System.getProperty("JUDGE") != null) {
            return new PrintWriter("aplusb.out");
        } else {
            return new PrintWriter(System.out);
        }
    }

    public static void main(String[] args) throws IOException {
        try (Scanner in = newInput(); PrintWriter out = newOutput()) {
            out.println(in.nextInt() + in.nextInt());
        }
    }
}
```

