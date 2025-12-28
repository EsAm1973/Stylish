import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/repos/profile_repo.dart';
import 'package:stylish/Features/home/presentation/manager/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    final result = await _profileRepo.fetchUserProfile();
    result.fold(
      (failure) => emit(ProfileFailure(failure.errorMessage)),
      (user) => emit(ProfileSuccess(user)),
    );
  }
}
