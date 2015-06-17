using System;

namespace IntegerDataTypes {
	class Program {
		public static void Main(String[] args) {

			int totalSecondsPlayed = 100;
			const int SECONDS_PER_MINUTE = 60;

			int totalMinutesPlayed = totalSecondsPlayed / SECONDS_PER_MINUTE;
			totalSecondsPlayed = totalSecondsPlayed % SECONDS_PER_MINUTE;

			Console.WriteLine("Minutes: " + totalMinutesPlayed);
			Console.WriteLine("Seconds: " + totalSecondsPlayed);

		}
	}
}