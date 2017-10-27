import java.io.*;
import java.util.*;
import java.math.*;

public class Main {

    public final String problemName = "stack";

    public final String inputFile = problemName + ".in";

    public final String outputFile = problemName + ".out";

    public final boolean ONSERVER = System.getProperty("JUDGE") != null;

    public FastScanner input;

    public PrintWriter output;

    public void solve() throws IOException {
        
        DoublyLinkedStack stack = new DoublyLinkedStack();
        int testCase = input.nextInt(), i = 0, value;
        String line;

        while(i++ != testCase) {
            line = input.next();
            if(line.equals("+")) {
                value = input.nextInt();
                stack.push(value);
            } else
                output.println(stack.pop());
        }

        output.flush();

    }

    public void run() {
        try {
            input = new FastScanner(new File(inputFile));
            output = ONSERVER ? new PrintWriter(outputFile) : new PrintWriter(System.out);

            solve();

            output.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    class FastScanner {
        BufferedReader br;
        StringTokenizer st;

        FastScanner(File f) {
            try {
                br = new BufferedReader(new FileReader(f));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }

        String next() {
            while (st == null || !st.hasMoreTokens()) {
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }

        int nextInt() {
            return Integer.parseInt(next());
        }
    }

    public static void main(String[] args) throws IOException {
        new Main().run();
        
    }
}

class DoublyLinkedStackNode {
    public int value;
    public DoublyLinkedStackNode next;
    public DoublyLinkedStackNode prev;

    public DoublyLinkedStackNode(int value, DoublyLinkedStackNode next, DoublyLinkedStackNode prev) {
        this.value = value;
        this.next = next;
        this.prev = prev;
    }

    public DoublyLinkedStackNode(int value) {
        this(value, null, null);
    }
}

class DoublyLinkedStack {

    public DoublyLinkedStackNode head;
    public DoublyLinkedStackNode tail;
    public int size;

    public DoublyLinkedStack() {
        this.head = this.tail = null;
        this.size = 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public void push(int value) {
        DoublyLinkedStackNode newNode;

        if(this.isEmpty())
            this.head = this.tail = new DoublyLinkedStackNode(value);

        else {
            newNode = new DoublyLinkedStackNode(value, null, this.tail);
            this.tail.next = newNode;
            this.tail = newNode;
        }

        this.size++;
    }

    public int pop() {
        int value = this.tail.value;
        DoublyLinkedStackNode replace = this.tail.prev;
        replace.next = null;
        this.tail = replace;
        this.size--;

        return value;
    }
}