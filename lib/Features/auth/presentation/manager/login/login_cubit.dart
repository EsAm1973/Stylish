import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/presentation/manager/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;

  LoginCubit(this._authRepo) : super(const LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginLoading());

    final result = await _authRepo.login(email: email, password: password);

    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (loginData) {
        emit(LoginSuccess(loginData: loginData));
      },
    );
  }

  void resetState() {
    emit(const LoginInitial());
  }
}
