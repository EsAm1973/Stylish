import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/presentation/manager/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;

  RegisterCubit(this._authRepo) : super(const RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    String? avatar,
  }) async {
    emit(const RegisterLoading());

    final result = await _authRepo.register(
      name: name,
      email: email,
      password: password,
      avatar: avatar,
    );

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        emit(RegisterSuccess(userData: userData));
      },
    );
  }

  /// Reset state to initial
  void resetState() {
    emit(const RegisterInitial());
  }
}
