String? fromNaN (String value) {
  if (value == 'NaN') {
    return null;
  } else {
    return value;
  }
}