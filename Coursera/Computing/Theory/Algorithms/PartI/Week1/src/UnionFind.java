import java.util.*;

public class UnionFind {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int n = in.nextInt();
	    QuickFindUF uf = new QuickFindUF(n);
	    
	    while(true) {
	        int p = in.nextInt();
	        int q = in.nextInt();

	        if(p == q)
	        	break;
	        
	        if(!uf.connected(p, q)) {
	            uf.union(p, q);
	            // System.out.println(p + " " + q);
	        }

	        for(int i = 0; i < n; i++)
	        	System.out.print(uf.id[i] + " ");
	        System.out.println();
    }
}
}