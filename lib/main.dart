import 'package:flutter/material.dart';
import 'package:session/core/local_storage/sql_helper/sql_helper.dart';

import 'core/local_storage/cache_helper/cache_helper.dart';
import 'core/network/dio_helper/dio_helper.dart';
import 'food_ninga_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  SQLHelper.initDb();
  runApp(const FoodNingaApp());
}
