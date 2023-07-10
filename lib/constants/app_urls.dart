class AppUrl {
  static var baseUrl = 'http://84.46.241.141:5001/api';

  /// Auth End Points
  static var signInEndPoint = '$baseUrl/signin';
  static var signUpEndPoint = '$baseUrl/signup';
  static var sendOTPEndPoint = '$baseUrl/send-otp';
  static var verifyOTPEndPoint = '$baseUrl/verify-otp';
  static var socialLoginEndPoint = '$baseUrl/login-with-social';
  static var sendOTPByPhoneNumberEndPoint = '$baseUrl/send-otp-by-phone-number';

  static var createProfileEndPoint = '$baseUrl/save-profile';

  static var uploadProfileImageEndPoint = '$baseUrl/uplaod-image';
}
