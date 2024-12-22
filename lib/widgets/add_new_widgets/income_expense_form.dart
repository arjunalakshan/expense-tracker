import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeExpenseForm extends StatefulWidget {
  final int currentSubmenuIndex;
  const IncomeExpenseForm({
    super.key,
    required this.currentSubmenuIndex,
  });

  @override
  State<IncomeExpenseForm> createState() => _IncomeExpenseFormState();
}

class _IncomeExpenseFormState extends State<IncomeExpenseForm> {
  //* Default categories to store the selected category
  ExpenseCategory _selectedExpenseCategory = ExpenseCategory.food;
  IncomeCategory _selectedIncomeCategory = IncomeCategory.salary;

  //* Controllers to store input field values
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  //* States to store date and time selected from date/time picker
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //* DropdownButtonFormField to select the category
          DropdownButtonFormField(
            items: widget.currentSubmenuIndex == 0
                ? ExpenseCategory.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList()
                : IncomeCategory.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
            onChanged: (value) {
              setState(() {
                widget.currentSubmenuIndex == 0
                    ? _selectedExpenseCategory = value as ExpenseCategory
                    : _selectedIncomeCategory = value as IncomeCategory;
              });
            },
            decoration: InputDecoration(
              labelText: "Category",
              labelStyle: const TextStyle(
                color: kBlack,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.all(defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide: const BorderSide(
                  color: kLightGrey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          //* Title input field
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: const TextStyle(
                color: kBlack,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.all(defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide: const BorderSide(
                  color: kLightGrey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          //* Note input field
          TextFormField(
            controller: _noteController,
            decoration: InputDecoration(
              labelText: "Note",
              labelStyle: const TextStyle(
                color: kBlack,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.all(defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide: const BorderSide(
                  color: kLightGrey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          //* Amount input field with numeric keyboard
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Amount",
              labelStyle: const TextStyle(
                color: kBlack,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.all(defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide: const BorderSide(
                  color: kLightGrey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          //* Date picker section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2030),
                    initialDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedDate = value;
                      });
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: kWhite,
                        size: 25,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Select date",
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                DateFormat.yMMMd().format(_selectedDate),
                style: const TextStyle(
                  color: kGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          //* Time picker section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _selectedTime = value;
                      });
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        color: kWhite,
                        size: 25,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Select time",
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                DateFormat.jm().format(
                  DateTime(
                    _selectedDate.year,
                    _selectedDate.month,
                    _selectedDate.day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  ),
                ),
                style: const TextStyle(
                  color: kGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: kLightGrey,
            thickness: 2,
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {},
            child: CustomButton(
              buttonText: "Add",
              buttonBgColor: widget.currentSubmenuIndex == 0 ? kRed : kGreen,
            ),
          ),
        ],
      ),
    );
  }
}
