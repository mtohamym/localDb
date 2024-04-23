import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/core/local_storage/cache_helper/cache_helper.dart';

import '../../../core/network/dio_helper/dio_helper.dart';
import '../../../core/network/endpoints.dart';
import '../model/login_response.dart';
import '../model/register_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController nameEt = TextEditingController();
  TextEditingController emailEt = TextEditingController();
  TextEditingController passwordEt = TextEditingController();
  TextEditingController phoneEt = TextEditingController();

  RegisterResponse? registerResponse;

  void registerUser() {
    Map<String, dynamic> data = {
      "name": nameEt.text,
      "email": emailEt.text,
      "password": passwordEt.text,
      "mobile": phoneEt.text
    };
    emit(AuthLoading());
    DioHelper.postData(url: registerEp, data: data).then((value) {
      if (value.statusCode == 200) {
        registerResponse = RegisterResponse.fromJson(value.data);
        emit(AuthSuccess());
      } else {
        emit(AuthFail());
      }
    }).catchError((e) {
      emit(AuthFail());
    });
  }

  LoginResponse? loginResponse;

  void login() {
    emit(AuthLoading());
    Map<String, String> data = {
      "email": emailEt.text,
      "password": passwordEt.text,
    };
    DioHelper.postData(url: loginEp, data: data).then((value) {
      if (value.statusCode == 200) {
        loginResponse = LoginResponse.fromJson(value.data);
        CacheHelper.saveData(key: "token", value: loginResponse!.token ?? "");
        print(loginResponse!.token);
        var token = CacheHelper.getData(key: "token");
        emit(AuthSuccess());
      } else {
        emit(AuthFail());
      }
    }).catchError((e) {
      emit(AuthFail());
    });
  }
}
