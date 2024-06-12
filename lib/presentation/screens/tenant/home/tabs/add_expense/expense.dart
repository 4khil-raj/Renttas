// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_expense/widget/fields.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

TextEditingController expenseDate = TextEditingController();

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});
  final categoryController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contsGreen,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Add Expense',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              AddExpenseFields2(
                  amountController: amountController,
                  categoryController: categoryController,
                  descriptionController: descriptionController,
                  nameController: nameController),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () {},
                textclr: Colors.white,
                borderclr: contsGreen,
                color: contsGreen,
                fontweight: FontWeight.w500,
                name: 'Save',
                height: 50,
                radius: 10,
                textsize: 16,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
