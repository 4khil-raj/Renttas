import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/get_bill_tenant/model.dart';
import 'package:renttas/infrastructure/repository/get_bill_tenant/repo.dart';

part 'get_tenant_bill_event.dart';
part 'get_tenant_bill_state.dart';

class GetTenantBillBloc extends Bloc<GetTenantBillEvent, GetTenantBillState> {
  GetTenantBillBloc() : super(GetTenantBillInitial()) {
    on<GetTenantBillEvent>((event, emit) {
      emit(GetTenantBillInitial());
    });

    on<FetchRequest>((event, emit) async {
      try {
        final response = await TenantBillsRepository().fetchTenantBills();
        emit(FetchedTenantBillState(list: response));
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }
}
