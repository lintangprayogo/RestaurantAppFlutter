part of 'services.dart';

class TransactionService {
    static Future<BaseApiResponse<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(milliseconds: 3));
    return BaseApiResponse(value: mockTransactions);
  }

  static Future<BaseApiResponse<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(milliseconds: 2));
    // return BaseApiResponse(msg: "transaction failed");
    return BaseApiResponse(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}