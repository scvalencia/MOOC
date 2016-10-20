import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

	public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static void main(String[] args) throws IOException {

        Scanner input =  ONSERVER ? 
        	new Scanner(new File("aplusb.in")) : 
        	new Scanner(System.in);

        PrintWriter output = ONSERVER ? 
        	new PrintWriter("aplusb.out") : 
        	new PrintWriter(System.out);

        String[] parse = input.nextLine().split(" ");

        BigInteger a = new BigInteger(parse[0]);
        BigInteger b = new BigInteger(parse[1]);
        BigInteger summation = a.add(b);

        output.print(summation);
        output.flush();
	}
}