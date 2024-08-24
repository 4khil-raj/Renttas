import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/fetch_expense/model.dart';
import 'package:renttas/infrastructure/repository/fetchExpense/repo.dart';

part 'fetchexpense_event.dart';
part 'fetchexpense_state.dart';

class FetchexpenseBloc extends Bloc<FetchexpenseEvent, FetchexpenseState> {
  FetchexpenseBloc() : super(FetchexpenseInitial()) {
    on<FetchexpenseEvent>((event, emit) {
      emit(FetchexpenseInitial());
    });

    on<GetExepenseEvent>((event, emit) async {
      final response = await FetchExpenseRepo.fetchExpense();
      emit(FetchExpenseSuccessState(list: response));
    });
  }
}
