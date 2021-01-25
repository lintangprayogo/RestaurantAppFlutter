part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactionList;

  TransactionLoaded(this.transactionList);

  @override
  List<Object> get props => [transactionList];
}

class TransactionFailed extends TransactionState {
  final String msg;

  TransactionFailed(this.msg);

  @override
  List<Object> get props => [msg];
}
