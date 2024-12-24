import 'package:expense_tracker/services/clear_user_data_service.dart';
import 'package:expense_tracker/services/expense_type_service.dart';
import 'package:expense_tracker/services/get_user_data_service.dart';
import 'package:expense_tracker/services/income_type_service.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/views/on_boarding/on_boarding_views.dart';
import 'package:expense_tracker/widgets/profile_widgets/profile_option_card.dart';
import 'package:expense_tracker/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    GetUserDataService.getUserData().then((value) {
      if (value["username"] != null && value["email"] != null) {
        setState(() {
          userName = value["username"]!;
          userEmail = value["email"]!;
        });
      }
    });
    super.initState();
  }

  void _showLogoutConfirmBottomsheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.25,
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const Text(
                  "Logout",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor.withOpacity(0.2),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: kMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        await ClearUserDataService.clearUserData();
                        if (context.mounted) {
                          await ExpenseTypeService().clearExpenseData(context);
                          await IncomeTypeService().clearIncomeData(context);
                        }

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingViews(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        border: Border.all(
                          color: kMainColor,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          "assets/images/profile_placeholder.jpg",
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userEmail,
                          style: const TextStyle(
                            fontSize: 14,
                            color: kGrey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 16,
                            color: kBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_rounded,
                        color: kMainColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 56,
                ),
                const ProfileOptionCard(
                  title: "My wallet",
                  leadIcon: Icons.wallet_rounded,
                  iconColor: kMainColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                const ProfileOptionCard(
                  title: "Settings",
                  leadIcon: Icons.settings_rounded,
                  iconColor: kMainColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                const ProfileOptionCard(
                  title: "Export Data",
                  leadIcon: Icons.file_download_rounded,
                  iconColor: kMainColor,
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    _showLogoutConfirmBottomsheet(context);
                  },
                  child: const ProfileOptionCard(
                    title: "Logout",
                    leadIcon: Icons.logout_rounded,
                    iconColor: kRed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
