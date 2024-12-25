bool isEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return true;
  }
  return false;
}

String? validateEmpty(String? value) {
  if (isEmpty(value)) {
    return 'Please enter a value';
  } else {
    return null;
  }
}

String? validateEmail(String value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (isEmpty(value)) {
    return 'Please enter an email';
  } else if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (isEmpty(value)) {
    return 'Please enter a password';
  } else if (value!.length < 6) {
    return 'Password must be at least 6 characters long';
  } else {
    return null;
  }
}

String? validateName(String? value) {
  if (isEmpty(value)) {
    return 'Please enter a name';
  } else if (value!.length < 4) {
    return 'Name must be at least 4 characters long';
  } else {
    return null;
  }
}

String? validatePhone(String? value) {
  if (isEmpty(value)) {
    return 'Please enter a phone number';
  } else if (value!.length < 11) {
    return 'Phone must be at least 11 characters long';
  } else {
    return null;
  }
}

String? validateDescription(String value) {
  if (isEmpty(value)) {
    return 'Please enter a description';
  } else if (value.length < 30) {
    return 'Description must be at least 30 characters long';
  } else {
    return null;
  }
}
