import 'package:expense_tracker/model/onboarding_details_model.dart';

class OnboardingData {
  final onboardingData = [
    OnboardingDetailsModel(
      imageUrl: "assets/images/onboard-1.png",
      title: "Gain total control of your money",
      shortDescription:
          "Become your own money manager and make every cent count",
    ),
    OnboardingDetailsModel(
      imageUrl: "assets/images/onboard-2.png",
      title: "Know where your money goes",
      shortDescription:
          "Track your transaction easily with categories and financial report ",
    ),
    OnboardingDetailsModel(
      imageUrl: "assets/images/onboard-3.png",
      title: "Planning ahead",
      shortDescription: "Setup your budget for each category so you in control",
    ),
  ];
}
