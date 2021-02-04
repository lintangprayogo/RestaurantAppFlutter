part of 'services.dart';

class FoodService {
  static Future<BaseApiResponse<List<Food>>> getFoods(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'food';

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return BaseApiResponse(msg: 'Please try again');
    }

    

    var data = jsonDecode(response.body);
 

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();


    return BaseApiResponse(value: foods);
  }
}
