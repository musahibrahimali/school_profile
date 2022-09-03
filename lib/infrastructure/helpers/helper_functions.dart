class HelperFunctions {
  // get the current year
  static String getYear() {
    DateTime now = DateTime.now();
    // return the current year
    return now.year.toString();
  }

  // get current month
  static String getMonth() {
    DateTime now = DateTime.now();
    // return the current month
    return now.month.toString();
  }

  // get current day
  static String getDay() {
    DateTime now = DateTime.now();
    // return the current day
    return now.day.toString();
  }

  // get the current time
  static String getTime() {
    DateTime now = DateTime.now();
    // return the current time
    return "${now.hour}:${now.minute}:${now.second}";
  }

  // capitalize a string
  static String capitalize(String string) {
    // return the string with the first letter capitalized
    return string[0].toUpperCase() + string.substring(1);
  }
}
