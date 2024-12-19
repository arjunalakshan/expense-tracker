import 'package:expense_tracker/views/home/home_view.dart';
import 'package:expense_tracker/views/on_boarding/on_boarding_views.dart';
import 'package:flutter/material.dart';

class WidgetWrapper extends StatefulWidget {
  final bool canShowHomeView;

  const WidgetWrapper({
    super.key,
    required this.canShowHomeView,
  });

  @override
  State<WidgetWrapper> createState() => _WidgetWrapperState();
}

class _WidgetWrapperState extends State<WidgetWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.canShowHomeView ? const HomeView() : const OnBoardingViews();
  }
}
