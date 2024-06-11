import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/widgets/floating_button.dart';

class HomeExpenseTab extends StatelessWidget {
  const HomeExpenseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Expense',
        onTap: () {},
      ),
      body: Center(
        child: Text('Expense Not found!'),
      ),
    );
  }
}
