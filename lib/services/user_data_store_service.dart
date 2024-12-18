import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataStoreService {
  static Future<void> storeUserData({
    required String userName,
    required String userEmail,
    required String userPwd,
    required String conPwd,
    required BuildContext context,
  }) async {
    try {
      //* Check Password match with Confirm password and show snackbar message if not
      if (userPwd != conPwd) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and Confirm password should be match"),
          ),
        );
        return;
      } else {
        //*Create Shared prefs instance
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        //* Store username, email in shared pres as key/val pair
        await sharedPreferences.setString("username", userName);
        await sharedPreferences.setString("email", userEmail);

        //* Show message after store data
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your data stored successfully"),
          ),
        );
      }
    } catch (error) {
      error.toString();
    }
  }
}
