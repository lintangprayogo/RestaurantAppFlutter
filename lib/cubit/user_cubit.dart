import 'package:bloc/bloc.dart';
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
}
