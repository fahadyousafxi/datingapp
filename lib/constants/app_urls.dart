const baseUrl = 'https://redrhythm.pk/mine/Papinetwork/public/api';

class AppUrl {
  static var baseUrl = 'https://redrhythm.pk/mine/Papinetwork/public/api';

  static var loginEndPoint = '$baseUrl/login/user';
  static var registerEndPoint = '$baseUrl/register/user';
  static var forgetPasswordEndPoint = '$baseUrl/forgetpassword/user';
  static var updatePasswordEndPoint = '$baseUrl/setpassword/user';
  static var forgetUsingPhoneEndPoint = '$baseUrl/forgetpassword/phone';
  static var maintenanceEndPoint = '$baseUrl/maintaince/user';
  static var getMiningSettingEndPoint = '$baseUrl/mining/get';

  // static var baseUrl = 'https://reqres.in';
  //
  // static var loginEndPoint = '$baseUrl/api/login';
  // static var registerEndPoint = '$baseUrl/api/register';

  static var testGetApiUrl = 'https://reqres.in/api/users?page=2';
}
