import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/expense.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeExpenseTab extends StatelessWidget {
  const HomeExpenseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Expense',
        onTap: () => customNavPush(context, AddExpenseScreen()),
      ),
      body: Center(
        child: Text('Expense Not found!'),
      ),
    );
  }
}
