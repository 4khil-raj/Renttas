import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/fetch_address/model.dart';
import 'package:renttas/infrastructure/repository/fetch_address/repo.dart';

part 'fetchaddress_event.dart';
part 'fetchaddress_state.dart';

class FetchaddressBloc extends Bloc<FetchaddressEvent, FetchaddressState> {
  FetchaddressBloc() : super(FetchaddressInitial()) {
    on<FetchaddressEvent>((event, emit) {
      emit(FetchaddressInitial());
    });

    on<FetchAddressReq>((event, emit) async {
      emit(Loading());
      print("==============================================ivite eehhi");
      try {
        final response = await AddressRepository().fetchAddresses();
        if (response.isNotEmpty) {
          print(response[0].pincode);
          print("==============================================ivite eehhi");
          emit(FetchSuccessState(list: response));
        } else {
          print("ntho problem ond");
          emit(FetchaddressInitial());
        }
      } catch (e) {
        print(
            "=====================ffffff=========================ivite eehhi${e.toString()}");
        log(e.toString());
        emit(ErrorStateFetchAddress(msg: e.toString()));
      }
    });
  }
}
