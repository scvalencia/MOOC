import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "prepare";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static Scanner input;

    public static PrintWriter output;

    public static int solve(int[] practice, int[] theory) {
        int accumulate = 0;
        int minDifference = 2000;
        boolean hasPractice = false;
        boolean hasTheory = false;

        for(int i = 0; i < practice.length; i++) {
            int pi = practice[i];
            int ti = theory[i];
            int max = Math.max(pi, ti);

            accumulate += max;

            if(pi == max) hasPractice = true;
            if(ti == max) hasTheory = true;

            minDifference = Math.min(minDifference, Math.abs(pi - ti));
        }

        if(!(hasPractice && hasTheory)) accumulate -= minDifference;

        return accumulate;
    }

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        int days = input.nextInt();

        int[] practice = new int[days];
        int[] theory = new int[days];

        for(int i = 0; i < days; i++)
            practice[i] = input.nextInt();

        for(int i = 0; i < days; i++)
            theory[i] = input.nextInt();

        output.print(solve(practice, theory));
        output.flush();
	}
}