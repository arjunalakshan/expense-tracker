import 'package:expense_tracker/services/user_data_store_service.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/views/home/home_view.dart';
import 'package:expense_tracker/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key});

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  bool isRemeberChecked = false;

  //*Form handler key
  final _formHandlerKey = GlobalKey<FormState>();

  //*Form field input controllers
  final TextEditingController _inputNameController = TextEditingController();
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputPasswordController =
      TextEditingController();
  final TextEditingController _inputConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _inputNameController.dispose();
    _inputEmailController.dispose();
    _inputPasswordController.dispose();
    _inputConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter your\nPersonal Details",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Form(
                key: _formHandlerKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _inputNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: const TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          borderSide: const BorderSide(
                            color: kGrey,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    TextFormField(
                      controller: _inputEmailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          borderSide: const BorderSide(
                            color: kGrey,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    TextFormField(
                      controller: _inputPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: kGrey,
                        ),
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          borderSide: const BorderSide(
                            color: kGrey,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    TextFormField(
                      controller: _inputConfirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please re-enter Password";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: kGrey,
                        ),
                        contentPadding: const EdgeInsets.all(defaultPadding),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          borderSide: const BorderSide(
                            color: kGrey,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Remember Me for the next time",
                          style: TextStyle(
                            color: kGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          child: Switch(
                            activeColor: kMainColor,
                            value: isRemeberChecked,
                            onChanged: (value) {
                              setState(() {
                                isRemeberChecked = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formHandlerKey.currentState!.validate()) {
                          if (isRemeberChecked) {
                            //*Store user entered data in local storage
                            await UserDataStoreService.storeUserData(
                              userName: _inputNameController.text,
                              userEmail: _inputEmailController.text,
                              userPwd: _inputPasswordController.text,
                              conPwd: _inputConfirmPasswordController.text,
                              context: context,
                            );

                            //*Navigete to next view after storing data
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                              );
                            }
                          } else {
                            //*Navigete to next view without storing data
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const CustomButton(
                        buttonText: "Submit",
                        buttonBgColor: kMainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
