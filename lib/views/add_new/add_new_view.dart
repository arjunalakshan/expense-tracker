import 'package:flutter/material.dart';

class AddNewView extends StatefulWidget {
  const AddNewView({super.key});

  @override
  State<AddNewView> createState() => _AddNewViewState();
}

class _AddNewViewState extends State<AddNewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new View"),
      ),
    );
  }
}
