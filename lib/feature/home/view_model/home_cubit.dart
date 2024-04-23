import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:session/core/local_storage/cache_helper/cache_helper.dart';

import '../../../core/network/dio_helper/dio_helper.dart';
import '../../../core/network/endpoints.dart';
import '../model/food_model.dart';
import '../model/resturant_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);

  ResturantModel? resturantModel;
  FoodModel? foodModel;

  void loadData(){
    getResturantsData();
    getFoods();
  }

  void getResturantsData() {
    emit(ReasturantDataLoading());
    String Token = CacheHelper.getData(key: "token");
    DioHelper.getData(url: resturantEp, token: Token).then((value) {
      if (value.statusCode == 200) {
        resturantModel = ResturantModel.fromJson(value.data);
        emit(ReasturantDataSuccess());
      }
      emit(ReasturantDataFail());
    }).catchError((onError) {
      emit(ReasturantDataFail());
    });
  }

  void getFoods() {
    emit(FoodDataLoading());
    String Token = CacheHelper.getData(key: "token");

    DioHelper.getData(url: foodEp, token: Token).then((value) {
      if (value.statusCode == 200) {
        foodModel = FoodModel.fromJson(value.data);
        emit(FoodDataSuccess());
      }
      emit(FoodDataFail());
    }).catchError((onError) {
      emit(FoodDataFail());
    });
  }
}
