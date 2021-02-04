part of 'services.dart';

class TransactionService {
  static Future<BaseApiResponse<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'transaction/?limit=1000';

    var response = await client.get(url, headers: {
      'Authorization': "Bearer ${User.token}",
      'Accept': 'application/json'
    });

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return BaseApiResponse(value: transactions);
  }

  static Future<BaseApiResponse<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'checkout';
    var response = await client.post(url,
        headers: {
          'Authorization': "Bearer ${User.token}",
           "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          "quantity": transaction.quantity,
          "total": transaction.total,
          "status": "PENDING"
        }));


    if (response.statusCode != 200) {
      return BaseApiResponse(msg: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);

    return BaseApiResponse(value: value);
  }
}
