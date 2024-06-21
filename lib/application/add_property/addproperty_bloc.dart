import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/add_property/models.dart';
import 'package:renttas/infrastructure/repository/add_property/repo.dart';

part 'addproperty_event.dart';
part 'addproperty_state.dart';

class AddpropertyBloc extends Bloc<AddpropertyEvent, AddpropertyState> {
  AddpropertyBloc() : super(AddpropertyInitial()) {
    on<AddpropertyEvent>((event, emit) {
      emit(AddpropertyInitial());
    });

    on<AddPropertyRequstEvent>((event, emit) async {
      try {
        final response = await AddPropertyRepo().addProperty(event.model);
        print(response);
        if (response) {
          emit(AddpropertySuccessState());
        } else {
          emit(AddpropertyErrorState(message: 'Try Again!!!'));
        }
      } catch (e) {
        emit(AddpropertyErrorState(message: "some error found $e"));
      }
    });
  }
}
