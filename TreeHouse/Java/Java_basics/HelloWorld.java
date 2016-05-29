import java.io.Console;

public class HelloWorld {
	public static void main(String[] args) {
		Console console = System.console();
		String name = console.readLine("What is your name? ");
		console.printf("Hello, my name is %s.\n", name);
		console.printf("%s is learning how to write Java.\n", name);
	}
}