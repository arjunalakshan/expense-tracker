import 'package:shared_preferences/shared_preferences.dart';

class GetUserDataService {
  static Future<Map<String, String>> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userName = sharedPreferences.getString("username") ?? "";
    String userEmail = sharedPreferences.getString("email") ?? "";
    return {
      "username": userName,
      "email": userEmail,
    };
  }
}
