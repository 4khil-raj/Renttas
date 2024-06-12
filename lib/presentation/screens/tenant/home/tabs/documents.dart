import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_docs/add_docs.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeDocumentsTab extends StatelessWidget {
  const HomeDocumentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Doucments',
        onTap: () => customNavPush(context, const AddDocumentsScreen()),
      ),
      body: Center(
        child: Text('Doucments Not found!'),
      ),
    );
  }
}
