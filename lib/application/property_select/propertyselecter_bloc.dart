import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'propertyselecter_event.dart';
part 'propertyselecter_state.dart';

class PropertyselecterBloc
    extends Bloc<PropertyselecterEvent, PropertyselecterState> {
  PropertyselecterBloc() : super(PropertyselecterInitial()) {
    on<PropertyselecterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PropertySelectEvent>((event, emit) {
      emit(PropertySelectedState(
          selectedProperty: event.property, id: event.id));
    });
  }
}
