part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ReasturantDataLoading extends HomeState {}
class ReasturantDataSuccess extends HomeState {}
class ReasturantDataFail extends HomeState {}

class FoodDataLoading extends HomeState {}
class FoodDataSuccess extends HomeState {}
class FoodDataFail extends HomeState {}