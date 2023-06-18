import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  /// login
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  /// logOut
  static Future<GoogleSignInAccount?> logOut() => _googleSignIn.signOut();
}
