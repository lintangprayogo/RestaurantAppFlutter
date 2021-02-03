part of 'services.dart';

class UserService {
  static Future<BaseApiResponse<User>> sigIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'login';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: 'Please try again');
    }
    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);
    value=value.copyWith(
            picturePath:
                "http://foodmartketbackend.lintangprayogo.xyz/storage/app/public/" +
                    value.picturePath);

    return BaseApiResponse(value: value);
  }

  static Future<BaseApiResponse<User>> signUp(User user, String password,
      {File picFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'register';
    var response = await client.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'address': user.address,
          'password': password,
          'password_confirmation': password,
          'phoneNumber': user.phoneNumber,
          'houseNumber': user.houseNumber,
          'city': user.city
        }));

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: 'Please try again');
    }
    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (picFile != null) {
      BaseApiResponse<String> result = await uploadPicture(picFile);
      if (result.value != null) {
        value = user.copyWith(
            picturePath:
                "http://foodmartketbackend.lintangprayogo.xyz/storage/app/public/" +
                    result.value);
      } else {
        value = user.copyWith(picturePath: data['profile_photo_url']);
      }
    }

    return BaseApiResponse(value: value);
  }

  static Future<BaseApiResponse<String>> uploadPicture(File picFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multipartFile = await http.MultipartFile.fromPath('file', picFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];
      return BaseApiResponse(value: imagePath);
    } else {
      return BaseApiResponse(msg: 'Uploading Profile Picture Failed');
    }
  }
}
