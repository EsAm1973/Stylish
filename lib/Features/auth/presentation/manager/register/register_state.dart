import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final Map<String, dynamic> userData;

  const RegisterSuccess({required this.userData});

  @override
  List<Object?> get props => [userData];
}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
