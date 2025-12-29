import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> fetchUserProfile();
}
