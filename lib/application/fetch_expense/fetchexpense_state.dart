part of 'fetchexpense_bloc.dart';

@immutable
sealed class FetchexpenseState {}

final class FetchexpenseInitial extends FetchexpenseState {}

final class FetchExpenseSuccessState extends FetchexpenseState {
  final List<FetchExpenseModel> list;

  FetchExpenseSuccessState({required this.list});
}
