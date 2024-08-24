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
      try {
        final response = await AddressRepository().fetchAddresses();

        emit(FetchSuccessState(
            address: response['data']['address'],
            pincode: response['data']['pincode']));
      } catch (e) {
        emit(ErrorStateFetchAddress(msg: e.toString()));
      }
    });
  }
}
