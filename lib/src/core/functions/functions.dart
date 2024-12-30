String? fromNaN(String value) {
  if (value == 'NaN') {
    return null;
  } else {
    return value;
  }
}

bool isNetworkImage(String path) {
  final uri = Uri.tryParse(path);
  return uri != null &&
      uri.hasScheme &&
      (uri.scheme == 'http' || uri.scheme == 'https');
}
