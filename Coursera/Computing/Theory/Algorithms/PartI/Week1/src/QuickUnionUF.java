public class QuickUnionUF {
    public int[] id;
    public int count; 
    
    public QuickUnionUF(int N) {
        id = new int[N];
        count = N;
        for (int i = 0; i < N; i++)
            id[i] = i;
    }
    
    public int find(int p) {
        while (p != id[p])
            p = id[p];
        return p;
    }
    
    public boolean connected(int p, int q) {
        return find(p) == find(q);
    }
  
    public void union(int p, int q) {
        int rootP = find(p);
        int rootQ = find(q);
        if (rootP == rootQ) return;
        id[rootP] = rootQ; 
        count--;
    }
}