import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/fetch_address/fetchaddress_bloc.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchaddressBloc, FetchaddressState>(
      builder: (context, state) {
        if (state is FetchSuccessState) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 203, 202, 201),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address: ${state.address}'),
                    Text("Pincode: ${state.pincode}")
                  ],
                ),
              ),
            ),
          );
        } else if (state is ErrorStateFetchAddress) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // return alerts(context, state.msg);
          });
        }
        return const Center(child: Text('No Address Found'));
      },
    );
  }
}
