// ignore_for_file: unused_local_variable
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/infrastructure/repository/forgetPassword/repo.dart';

part 'forgetpassword_event.dart';
part 'forgetpassword_state.dart';

class ForgetpasswordBloc
    extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  ForgetpasswordBloc() : super(ForgetpasswordInitial()) {
    String otp = '';
    on<ForgetpasswordEvent>((event, emit) {
      emit(ForgetpasswordInitial());
    });
    on<ForgetRequestEvent>((event, emit) async {
      emit(ForgetRequestedState());
      if (event.email.isEmpty) {
        emit(ForgetPasswordErrorState(msg: "Enter Your email"));
      } else {
        final response = await ForgetPasswordRepo().forgetpassword(event.email);
        if (response == 'email not found') {
          emit(ForgetPasswordErrorState(msg: response));
        } else if (response.isEmpty) {
          emit(ForgetPasswordErrorState(msg: response));
        } else {
          otp = response;
          emit(OtpSendSuccessState());
        }
      }
    });
    on<ForgetOtpChecking>((event, emit) {
      if (event.otp == otp) {
        emit(OtpVerifiedState());
      } else {
        emit(ForgetPasswordErrorState(msg: 'Enterd wrong OTP'));
      }
    });
  }
}
