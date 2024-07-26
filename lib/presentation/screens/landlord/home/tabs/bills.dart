// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/bill_fetch/propertybillfetch_bloc.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/add_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/bill_builder.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Rent Bill',
        onTap: () => customNavPush(context, TenantAddBillScreen()),
      ),
      body: BlocBuilder<PropertybillfetchBloc, PropertybillfetchState>(
        builder: (context, state) {
          if (state is BillLoadedSucussState) {
            return PropertyBillBuilder(
              state: state,
            );
          } else if (state is EmptyState) {
            return Center(
              child: Text('Bill Not found'),
            );
          } else if (state is BillLoadingState) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Color.fromARGB(255, 0, 0, 0),
                size: 40,
              ),
            );
          }
          return Center(
            child: Text('No Property Selected'),
          );
        },
      ),
    );
  }
}
