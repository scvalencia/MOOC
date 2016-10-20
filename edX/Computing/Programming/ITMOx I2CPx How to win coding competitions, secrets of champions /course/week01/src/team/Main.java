import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "team";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static Scanner input;

    public static PrintWriter output;

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        int acdr, amth, atst;
        int tcdr, tmth, ttst;
        int pcdr, pmth, ptst;

        acdr = input.nextInt();
        amth = input.nextInt();
        atst = input.nextInt();
        tcdr = input.nextInt();
        tmth = input.nextInt();
        ttst = input.nextInt();
        pcdr = input.nextInt();
        pmth = input.nextInt();
        ptst = input.nextInt();

        double efficiencyAcdr1 = Math.sqrt(acdr * acdr + tmth * tmth + ptst * ptst);
        double efficiencyAcdr2 = Math.sqrt(acdr * acdr + ttst * ttst + pmth * pmth);
        double efficiencyAmth1 = Math.sqrt(amth * amth + tcdr * tcdr + ptst * ptst);
        double efficiencyAmth2 = Math.sqrt(amth * amth + ttst * ttst + pcdr * pcdr);
        double efficiencyAtst1 = Math.sqrt(atst * atst + tmth * tmth + pcdr * pcdr);
        double efficiencyAtst2 = Math.sqrt(atst * atst + tcdr * tcdr + pmth * pmth);

        double maxAcdr = Math.max(efficiencyAcdr1, efficiencyAcdr2);
        double maxAmth = Math.max(efficiencyAmth1, efficiencyAmth2);
        double maxAtst = Math.max(efficiencyAtst1, efficiencyAtst2);

        double max = Math.max(maxAcdr, Math.max(maxAmth, maxAtst));


        output.printf("%.7f", max);
        output.flush();
	}
}