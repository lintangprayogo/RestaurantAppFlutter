part of 'services.dart';

class TransactionService {
  static Future<BaseApiResponse<List<Transaction>>> getTransaction() async {
    await Future.delayed(Duration(milliseconds: 3));
    return BaseApiResponse(value: mockTransactions);
  }
}
