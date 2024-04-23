import 'package:flutter/material.dart';

import 'core/local_storage/cache_helper/cache_helper.dart';
import 'core/network/dio_helper/dio_helper.dart';
import 'food_ninga_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  runApp(const FoodNingaApp());
}
