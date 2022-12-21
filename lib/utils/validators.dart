String? validateMobileNumber(String? value) {
  if (value?.isEmpty == true) {
    return 'Phone Number Required';
  }
  return null;
}