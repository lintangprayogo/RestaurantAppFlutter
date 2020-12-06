import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurantappflutter/models/models.dart';
import 'package:restaurantappflutter/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());
  Future<void> getFoods() async {
    BaseApiResponse<List<Food>> result = await FoodService.getFoods();
    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodFailed(result.msg));
    }
  }
}
