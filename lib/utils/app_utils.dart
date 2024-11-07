import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  // get user access token :
  static Future<String> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("access") ?? "";
  }

  // get user refresh token :
  static Future<String> getRefreshToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("refresh") ?? "";
  }

  // storing user tokens to shared preferences :
  static Future<void> setUserTokens(
      {final String? accessToken, final String? refreshToken}) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("access", accessToken ?? "");
    pref.setString("refresh", refreshToken ?? "");
  }
}
