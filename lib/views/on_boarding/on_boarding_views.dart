import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/views/user_form/user_details_form.dart';
import 'package:expense_tracker/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/data/onboarding_data.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/views/on_boarding/widgets/landing_view.dart';
import 'package:expense_tracker/views/on_boarding/widgets/shared_onboarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViews extends StatefulWidget {
  const OnBoardingViews({super.key});

  @override
  State<OnBoardingViews> createState() => _OnBoardingViewsState();
}

class _OnBoardingViewsState extends State<OnBoardingViews> {
  final PageController _pageController = PageController();
  bool isInEndOfOnboarding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        index == 3
                            ? isInEndOfOnboarding = true
                            : isInEndOfOnboarding = false;
                      });
                    },
                    children: [
                      const LandingView(),
                      SharedOnboardingView(
                        imageUrl: OnboardingData().onboardingData[0].imageUrl,
                        title: OnboardingData().onboardingData[0].title,
                        shortDescription:
                            OnboardingData().onboardingData[0].shortDescription,
                      ),
                      SharedOnboardingView(
                        imageUrl: OnboardingData().onboardingData[1].imageUrl,
                        title: OnboardingData().onboardingData[1].title,
                        shortDescription:
                            OnboardingData().onboardingData[1].shortDescription,
                      ),
                      SharedOnboardingView(
                        imageUrl: OnboardingData().onboardingData[2].imageUrl,
                        title: OnboardingData().onboardingData[2].title,
                        shortDescription:
                            OnboardingData().onboardingData[2].shortDescription,
                      ),
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 0.60),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 4,
                      effect: const WormEffect(
                        dotColor: kLightGrey,
                        activeDotColor: kMainColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: !isInEndOfOnboarding
                        ? GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                _pageController.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustomButton(
                              buttonText:
                                  isInEndOfOnboarding ? "Get started" : "Next",
                              buttonBgColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsForm(),
                                ),
                              );
                            },
                            child: CustomButton(
                              buttonText:
                                  isInEndOfOnboarding ? "Get started" : "Next",
                              buttonBgColor: kMainColor,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
