String numberWithCommas(num? x) {
  if (x == null) return '0.00'; // Handle null case
  // Format the number to two decimal places and add commas
  return x.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

String numberWithCommasAndPercentage(num? x) {
  if (x == null) return '0.0%'; // Handle null case

  // Format the number to one decimal place and add commas
  String formattedNumber = x.toStringAsFixed(1).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  // Append the percentage sign
  return '$formattedNumber%';
}
