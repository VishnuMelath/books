String getAvgRating(List<double> ratings) {
  if (ratings.isEmpty) {
    return 'NA';
  } else {
    var total = ratings.fold<double>(
      0,
      (previousValue, element) => previousValue + element,
    );
    var rating = total / ratings.length;
    return rating.toStringAsFixed(1);
  }
}
