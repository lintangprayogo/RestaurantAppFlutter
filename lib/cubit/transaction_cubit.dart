import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurantappflutter/models/models.dart';
import 'package:restaurantappflutter/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  Future<void> getTransactions() async {
    BaseApiResponse<List<Transaction>> result =
        await TransactionService.getTransactions();
    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionFailed(result.msg));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    BaseApiResponse<Transaction> result =
        await TransactionService.submitTransaction(transaction);
    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transactionList + [result.value]));
      return true;
    } else {
      emit(TransactionFailed(result.msg));
      return false;
    }
  }
}
