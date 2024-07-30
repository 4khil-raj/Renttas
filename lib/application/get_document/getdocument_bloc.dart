import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/get_document/landlord.dart';
import 'package:renttas/infrastructure/repository/get_document/landlord.dart';

part 'getdocument_event.dart';
part 'getdocument_state.dart';

class GetdocumentBloc extends Bloc<GetdocumentEvent, GetdocumentState> {
  GetdocumentBloc() : super(GetdocumentInitial()) {
    on<GetdocumentEvent>((event, emit) {
      emit(GetdocumentInitial());
    });
    on<GetDocEvent>((event, emit) async {
      try {
        final response = await GetDocumentLandlord.getDoc();
        if (response.isNotEmpty) {
          emit(DocFetchDone(list: response));
        }
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }
    });
  }
}
