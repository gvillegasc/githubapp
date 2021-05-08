String differentDate(DateTime commitDate) {
  final today = DateTime.now();
  final different = today.difference(commitDate);
  final differentHours = different.inHours;
  if (different.inMinutes <= 0) {
    return '${different.inMinutes} sec';
  } else if (differentHours <= 0) {
    return '${different.inMinutes} min';
  } else if (differentHours <= 24) {
    return '${different.inHours} h';
  } else {
    return '${different.inDays} days';
  }
}
