import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "testgen";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static final int MAX_BOUND = 100000000;

    public static final int MAX_PRIME_FACTOR = 35000;

    public static List<Integer> primes;

    public static Scanner input;

    public static PrintWriter output;

    public static void sieve() {
        primes = new ArrayList<Integer>();
        boolean[] bit = new boolean[MAX_PRIME_FACTOR + 10];

        for(int i = 2; i < MAX_PRIME_FACTOR; i++) 
            bit[i] = true;

        for(int i = 2; i <= MAX_PRIME_FACTOR; i++) {
            if(bit[i])
                for(int j = i * i; j <= MAX_PRIME_FACTOR; j += i)
                    bit[j] = false;

            primes.add(i);
        }
    }

    public static int divisorsCount(int n) {   
        int index = 0, factor = primes.get(0), ans = 1;

        while(factor * factor <= n) {
            int power = 0;
            while(n % factor == 0) {
                n /= factor;
                power++;
            }
            ans *= (power + 1);
            factor = primes.get(++index);
        }

        if(n != 1) ans *= 2;

        return ans;
    }

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        sieve();

        int number = input.nextInt();
        int maxNumber = 0, maxDivisors = 0;

        for(int i = 2; i <= number; i++) {
            int divisors = divisorsCount(i);
            if(divisors > maxDivisors) {
                maxDivisors = divisors;
                maxNumber = i;
            }
        }
        
        output.print(number - maxNumber + 1);
        output.flush();
	}
}