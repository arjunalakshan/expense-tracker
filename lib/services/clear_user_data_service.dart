import 'package:shared_preferences/shared_preferences.dart';

class ClearUserDataService {
  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("username");
    await sharedPreferences.remove("email");
  }
}
