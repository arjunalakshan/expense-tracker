import 'package:expense_tracker/services/check_user_data_stored.dart';
import 'package:expense_tracker/widgets/widget_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CheckUserDataStored.isUserDataStored(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          //*Check snapshot have the loaded local store data and set the variable to true/false
          bool isUserDataThere = snapshot.data ?? false;
          return MaterialApp(
            title: "Expense tracker",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            home: WidgetWrapper(
              canShowHomeView: isUserDataThere,
            ),
          );
        }
      },
    );
  }
}
