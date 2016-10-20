import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "win";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static Scanner input;

    public static PrintWriter output;

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        int number = input.nextInt(), accumulate = 0, i = 0;
        int[] times = new int[number];

        for(i = 0; i < number; i++)
            times[i] = input.nextInt();

        Arrays.sort(times);

        for(i = 0; i < number; i++) {
            if(accumulate + times[i] > 18000) break;
            accumulate += times[i];
        }

        output.print(i);
        output.flush();
	}
}