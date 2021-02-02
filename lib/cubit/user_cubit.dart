import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:restaurantappflutter/models/models.dart';
import 'package:restaurantappflutter/services/services.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    BaseApiResponse<User> result = await UserService.sigIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserFailed(result.msg));
    }
  }

  Future<void> signUp(User user, String password, File picFile) async {
    BaseApiResponse<User> result =
        await UserService.signUp(user, password, picFile: picFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserFailed(result.msg));
    }
  }

  Future<void> updateProfilePicture(File pictureFile) async {
    BaseApiResponse<String> result =
        await UserService.uploadPicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath:
              "http://foodmartketbackend.lintangprayogo.xyz/storage/app/public/" +
                  result.value)));
    }
  }
}
