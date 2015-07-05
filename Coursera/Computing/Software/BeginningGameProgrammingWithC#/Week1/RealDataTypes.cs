using System;

namespace RealDataTypes {
	class Program {
		public static void Main(String[] args) {
			int score = 1356;
			int totalSecondsPlayed = 10000;

			float pointsPerSecond = (float) score / (float) totalSecondsPlayed;

			Console.WriteLine("Points per second: " + pointsPerSecond);
		}
	}
}