import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/widgets/floating_button.dart';

class HomeDocumentsTab extends StatelessWidget {
  const HomeDocumentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Doucments',
        onTap: () {},
      ),
      body: Center(
        child: Text('Doucments Not found!'),
      ),
    );
  }
}
