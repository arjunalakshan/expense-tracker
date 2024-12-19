import 'package:shared_preferences/shared_preferences.dart';

class CheckUserDataStored {
  static Future<bool> isUserDataStored() async {
    //* Create instance to get stored local user data
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? userEmail = sharedPreferences.getString("email");

    return userEmail != null;
  }
}
