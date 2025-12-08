import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    String? avatar,
  });

  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
}
