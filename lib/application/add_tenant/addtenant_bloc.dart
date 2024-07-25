import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import 'package:renttas/domain/models/getTenant/models.dart';
import 'package:renttas/infrastructure/repository/add_tenant/repo.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';

part 'addtenant_event.dart';
part 'addtenant_state.dart';

class AddtenantBloc extends Bloc<AddtenantEvent, AddtenantState> {
  AddtenantBloc() : super(AddtenantInitial()) {
    on<AddtenantEvent>((event, emit) {
      emit(AddtenantInitial());
    });
    on<AddTenantRequstEvent>((event, emit) async {
      try {
        final response = await AddTenantRepo.addTenant(event.model);
        if (response) {
          emit(TenantLoadingState());
        } else {
          emit(TenantAddErrorState(message: "Some error occurs"));
        }
      } catch (e) {
        print(e);
      }
    });

    on<GetTenantEvent>((event, emit) async {
      final getResponse = await GetTenantRepo.getTenantReq(
          currentPropertyId, currentSubpropertyId);
      emit(TenantAddSuccess(list: getResponse));
    });
  }
}
