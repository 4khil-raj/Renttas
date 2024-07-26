part of 'fetchaddress_bloc.dart';

@immutable
sealed class FetchaddressState {}

final class FetchaddressInitial extends FetchaddressState {}

final class FetchSuccessState extends FetchaddressState {
  final List<FetchAddressModel> list;

  FetchSuccessState({required this.list});
}

final class ErrorStateFetchAddress extends FetchaddressState {
  final String msg;

  ErrorStateFetchAddress({required this.msg});
}

final class Loading extends FetchaddressState {}
