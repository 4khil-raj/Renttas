part of 'fetchaddress_bloc.dart';

@immutable
sealed class FetchaddressState {}

final class FetchaddressInitial extends FetchaddressState {}

final class FetchSuccessState extends FetchaddressState {
  final String address;
  final String pincode;

  FetchSuccessState({
    required this.address,
    required this.pincode,
  });
}

final class ErrorStateFetchAddress extends FetchaddressState {
  final String msg;

  ErrorStateFetchAddress({required this.msg});
}

final class Loading extends FetchaddressState {}
