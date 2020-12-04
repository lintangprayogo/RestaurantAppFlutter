part of 'services.dart';

class FoodService {
  static Future<BaseApiResponse<List<Food>>> getFoods() async {
    await Future.delayed(Duration(milliseconds: 500));
    return BaseApiResponse(value: mockFoods);
  }
}
