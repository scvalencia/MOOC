import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public static final String problemName = "template";

    public static final String inputFile = problemName + ".in";

    public static final String outputFile = problemName + ".out";

    public static final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public static Scanner input;

    public static PrintWriter output;

    public static HashMap<Character, int[]> keyboardLayout;

    public static HashMap<String, String> code;

    public static int neededTime(String language) {
        int ans = 0;
        String src = code.get(language);
        if(src.length() == 1) {
            int[] coordinates = keyboardLayout.get(src.charAt(0));
            ans = Math.abs(coordinates[0] - coordinates[1]);
        } else {

            for(int i = 0; i < src.length() - 1; i++) {
                char ch1 = src.charAt(i);
                char ch2 = src.charAt(i + 1);

                int[] c1 = keyboardLayout.get(ch1);
                int[] c2 = keyboardLayout.get(ch2);

                int x1 = c1[0], y1 = c1[1];
                int x2 = c2[0], y2 = c2[1];

                ans += Math.max(Math.abs(x1 - x2), Math.abs(y1 - y2));
            }
        }

        return ans;
    }

    public static void main(String[] args) throws IOException {

        input = ONSERVER ? new Scanner(new File(inputFile)) : new Scanner(System.in);
        output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

        keyboardLayout = new HashMap<Character, int[]>();
        code = new HashMap<String, String>();

        int width = input.nextInt();
        int height = input.nextInt();

        input.nextLine();

        for(int h = 0; h < height; h++) {
            String line = input.nextLine();
            //System.out.println(line);
            for(int w = 0; w < width; w++) {
                
                char ch = line.charAt(w);
                //System.out.print(ch + " ");
                int[] position = new int[]{w + 1, height - h};
                keyboardLayout.put(ch, position);
            }
            //System.out.println();
        }

        
    
        /*
        for(char ch : keyboardLayout.keySet())
            System.out.println(ch + " " + Arrays.toString(keyboardLayout.get(ch)));
        */
        

        input.nextLine();

        for(int i = 0; i < 3; i++) {
            String languaje = input.nextLine();
            String src = "", line = "";

            while(true) {
                try {
                    line = input.nextLine();
                    if(line.equals("")) break;
                    else src += line;
                } catch(Exception e) { break; }
            }

            code.put(languaje, src);
            
        }

        String minLang = "";
        int minTime = Integer.MAX_VALUE;
        for(String lang : code.keySet()) {
            int time = neededTime(lang);
            if(time < minTime) {
                minTime = time;
                minLang = lang;
            }
        }

        output.print(minLang + "\n" + minTime);
        output.flush();
	}
}