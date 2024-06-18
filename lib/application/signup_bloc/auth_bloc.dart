import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/signup_models/models.dart';
import 'package:renttas/infrastructure/repository/signup_repo/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });

    on<SignUpRequestEvent>((event, emit) async {
      emit(SignUpEventCalled());
      final reqbody = await SignUpRepo().signupReq(event.user);
      if (reqbody == 'Success') {
        emit(SignupSuccesState());
      } else {
        emit(AuthErrorState(message: reqbody));
      }
    });
  }
}
