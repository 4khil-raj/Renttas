import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/add_property.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/widget/property_builder.dart';

class AppBarAddPropertys extends StatefulWidget {
  const AppBarAddPropertys({super.key});

  @override
  State<AppBarAddPropertys> createState() => _AppBarAddPropertysState();
}

class _AppBarAddPropertysState extends State<AppBarAddPropertys> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchpropertyBloc, FetchpropertyState>(
      builder: (context, state) {
        if (state is FetchingSuccessState) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   setState(() {
          //     propertyloading = false;
          //   });
          // });
          return PropertyBuilderLandlord(
            state: state.list,
          );
        } else if (state is EmptyList) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            propertyloading = true;
            Center(
              child: Text("data"),
            );
          });
        }

        return Center(
          child: CircularProgressIndicator(
            color: contsGreen,
          ),
        );
      },
    );
  }
}
