extension DateTimeFormatting on DateTime {
  String to12HourFormatWithPeriod() {
    final hour = this.hour;
    final minute = this.minute;

    final isAM = hour < 12;

    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    final formattedMinute = minute.toString().padLeft(2, "0");

    final period = isAM ? "AM" : "PM";

    return "$formattedHour:$formattedMinute $period";
  }
}
