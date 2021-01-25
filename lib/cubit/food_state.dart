part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final List<Food> foodList;

  FoodLoaded(this.foodList);

  @override
  List<Object> get props => [foodList];
}

class FoodFailed extends FoodState {
  final String msg;

  FoodFailed(this.msg);

  @override
  List<Object> get props => [msg];
}