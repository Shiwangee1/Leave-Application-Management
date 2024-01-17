package Employee;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class WorkingDaysCalculator {

	public static long calculateWorkingDays(String startDateString, String endDateString) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(startDateString, formatter);
		LocalDate endDate = LocalDate.parse(endDateString, formatter);

		long workingDays = 0;

		while (!startDate.isAfter(endDate)) {
			if (startDate.getDayOfWeek() != DayOfWeek.SATURDAY && startDate.getDayOfWeek() != DayOfWeek.SUNDAY) {
				workingDays++;
			}
			startDate = startDate.plusDays(1);
		}

		return workingDays;
	}
}