import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "chairs";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static Scanner input;

    public static PrintWriter output;

    public static double distance(double[] p1, double[] p2) {
        return Math.sqrt(Math.pow(p1[0] - p2[0], 2) + Math.pow(p1[1] - p2[1], 2));
    }

    public static double[] midpoint(double x1, double y1, double x2, double y2) {
        double[] ans = new double[2];

        ans[0] = (x1 + x2) / 2.0;
        ans[1] = (y1 + y2) / 2.0;

        return ans;
    }

    public static double solve(double a, double b, double c) {
        double x1 = 0.0, y1 = 0.0;
        double x2 = a, y2 = 0.0;

        double x3 = ((Math.pow(a, 2) + Math.pow(b, 2)) - Math.pow(c, 2)) / (2 * a);
        double y3 = Math.sqrt(Math.pow(b, 2) - Math.pow(x3, 2));

        double[] m1 = midpoint(x1, y1, x2, y2);
        double[] m2 = midpoint(x1, y1, x3, y3);
        double[] m3 = midpoint(x3, y3, x2, y2);

        double d1 = distance(m1, m2);
        double d2 = distance(m1, m3);
        double d3 = distance(m3, m2);

        return (d1 + d2 + d3) / 3.0;
    }

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        String[] parse = input.nextLine().split(" ");
        double[] sides = new double[3];

        for(int i = 0; i < 3; i++)
            sides[i] = (double) Integer.parseInt(parse[i]);

        output.printf("%.7f", solve(sides[2], sides[1], sides[0]));
        output.flush();
	}
}