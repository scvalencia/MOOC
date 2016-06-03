public class QuickFindUF {
    public int[] id;
    public int count; 
    
    public QuickFindUF(int N) {
        count = N;
        id = new int[N];
        for (int i = 0; i < N; i++)
            id[i] = i;
    }
    
    public int find(int p) {
        return id[p];
    }
    
    public boolean connected(int p, int q) {
        return id[p] == id[q];
    }
  
    public void union(int p, int q) {
        int pID = id[p];   // needed for correctness
        int qID = id[q];   // to reduce the number of array accesses

        // p and q are already in the same component
        if (pID == qID) return;

        for (int i = 0; i < id.length; i++)
            if (id[i] == pID) id[i] = qID;
        count--;
    }
}