class Validators {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.trim().length < 3) return 'Name is too short';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!regex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (!hasMinLength(value) || !hasNumber(value) || !hasUpperAndLower(value)) {
      return 'Password does not meet the requirements';
    }
    return null;
  }

  // قواعد الباسورد (بتتستخدم كمان في الـ checklist اللايف في SignUp)
  static bool hasMinLength(String v) => v.length >= 8;
  static bool hasNumber(String v) => RegExp(r'\d').hasMatch(v);
  static bool hasUpperAndLower(String v) =>
      RegExp(r'[A-Z]').hasMatch(v) && RegExp(r'[a-z]').hasMatch(v);
}
