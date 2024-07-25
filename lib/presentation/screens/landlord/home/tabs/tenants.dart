// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/add_tenant.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/tenant_builder.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeTenantsTab extends StatelessWidget {
  const HomeTenantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Tenant',
        onTap: () => customNavPush(
            context,
            AddTenantScreen(
              isEdit: false,
            )),
      ),
      body: BlocBuilder<AddtenantBloc, AddtenantState>(
        builder: (context, state) {
          if (state is TenantLoadingState) {
            BlocProvider.of<AddtenantBloc>(context).add(GetTenantEvent());
            return CircularProgressIndicator();
          } else if (state is TenantAddSuccess) {
            return state.list.isEmpty
                ? Center(child: Text('Tenant Not found!'))
                : GetTenantBuilderLandlordScreen(
                    state: state,
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
