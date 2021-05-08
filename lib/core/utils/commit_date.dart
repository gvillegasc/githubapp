String commitDate(String commitDate, String today) {
  try {
    final different =
        DateTime.parse(today).difference(DateTime.parse(commitDate));
    final differentHours = different.inHours;
    if (different.inMinutes <= 0) {
      return '${different.inSeconds} sec';
    } else if (differentHours <= 0) {
      return '${different.inMinutes} min';
    } else if (differentHours <= 24) {
      return '${different.inHours} h';
    } else {
      return '${different.inDays} days';
    }
  } catch (e) {
    return '';
  }
}
