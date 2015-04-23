using System; 
public class Sum {
	static void Main(String[] args) { 
		int sum = 0;
		for (int i=0; i<args.Length; i++)
			sum += int.Parse(args[i]); 
		Console.WriteLine("The sum is " + sum);
	} 
}