import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/add_property/addproperty_bloc.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/application/addproperty_bill/addpropertybill_bloc.dart';
import 'package:renttas/application/bill_fetch/propertybillfetch_bloc.dart';
import 'package:renttas/application/fetch_address/fetchaddress_bloc.dart';
import 'package:renttas/application/fetch_expense/fetchexpense_bloc.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/application/forgetpassword/forgetpassword_bloc.dart';
import 'package:renttas/application/image_picker/imagepicker_bloc.dart';
import 'package:renttas/application/login_bloc/login_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/application/signup_bloc/auth_bloc.dart';
import 'package:renttas/presentation/screens/splash/splash.dart';

const loginTocken = '';
void main() {
  runApp(const MyApp());
}

Color contsGreen = const Color.fromARGB(255, 82, 144, 83);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ForgetpasswordBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => AddpropertyBloc()),
        BlocProvider(create: (context) => FetchpropertyBloc()),
        BlocProvider(create: (context) => PropertyselecterBloc()),
        BlocProvider(create: (context) => AddpropertybillBloc()),
        BlocProvider(create: (context) => PropertybillfetchBloc()),
        BlocProvider(create: (context) => AddtenantBloc()),
        BlocProvider(create: (context) => FetchexpenseBloc()),
        BlocProvider(create: (context) => ImagepickerBloc()),
        BlocProvider(create: (context) => FetchaddressBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Renttas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
