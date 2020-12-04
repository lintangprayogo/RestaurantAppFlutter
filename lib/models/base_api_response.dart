part of 'models.dart';

class BaseApiResponse<T> {
  final T value;
  final String msg;
  BaseApiResponse({this.value, this.msg});
}
