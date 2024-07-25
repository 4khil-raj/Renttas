part of 'addtenant_bloc.dart';

@immutable
sealed class AddtenantState {}

final class AddtenantInitial extends AddtenantState {}

final class TenantAddSuccess extends AddtenantState {
  final List<GetTenantModel> list;
  TenantAddSuccess({required this.list});
}

final class TenantAddErrorState extends AddtenantState {
  final String message;
  TenantAddErrorState({required this.message});
}

final class TenantLoadingState extends AddtenantState {}
