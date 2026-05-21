class AppValidator{

  static bool validateMobile(String mobile) {
    //String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    //String pattern = r'(^([0-9]{10})$)';
    //String pattern = r'^(?![0+])+^([0-9]{10})$';
    String pattern = r'^(\+91)?(-)?\s*?(91)?\s*?(\d{3})-?\s*?(\d{3})-?\s*?(\d{4})';
    RegExp regExp = RegExp(pattern);
    if (mobile.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(mobile)) {
      return false;
    }
    return true;
  }

  static bool isNull(String? str) {
    return str == null || str.isEmpty;
  }
}