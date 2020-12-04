part of 'services.dart';

class UserService {
  static Future<BaseApiResponse<User>> sigIn(
      String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));
    return BaseApiResponse(value: mockUser);
  }
}
