import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';

/// Abstract repository for authentication operations
abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    String? avatar,
  });
}
