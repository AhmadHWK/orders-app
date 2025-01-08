// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:programming_languages_project/core/Constant/strings.dart';
import 'package:programming_languages_project/core/api/custom_dio.dart';
import 'package:programming_languages_project/core/cache/cache_memory.dart';
import 'package:programming_languages_project/core/errors/handle_exceptions.dart';
import 'package:programming_languages_project/core/models/user_model.dart';
import '/core/api/endpoints.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  DioClients dio;
  AuthCubit(this.dio) : super(AuthInitial());

  XFile? profilePic;
  UserModel? user;
  uploadProfilePic(image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  register(Map<String, dynamic> data) async {
    try {
      emit(SignUpLoading());
      final response = await dio.post(Endpoints.register, data: data);

      emit(SignUpSuccess(message: AppStrings.signUpMessage));
    } on ServerException catch (e) {
      print(e);
      emit(SignUpFailure(errMessage: e.errMessage));
    }
  }

  signIn(Map<String, dynamic> data) async {
    try {
      emit(SignInLoading());
      final response = await dio.post(Endpoints.signIn, data: data);
      final userModel = UserModel.fromJson(response);
      user = userModel;
      CacheMemory.instance.saveData(key: 'token', value: userModel.data.token);
      emit(SignInSuccess(
          message: AppStrings.signInMessage, userModel: userModel));
    } on ServerException catch (e) {
      print(e);
      emit(SignInFailure(errMessage: e.errMessage));
    }
  }

  logOut() async {
    try {
      emit(LogOutLoading());
      await dio.post(Endpoints.logOut);
      emit(LogOutSuccess(message: AppStrings.logOutMessage));
    } on ServerException catch (e) {
      print(e);
      emit(LogOutFailure(errMessage: e.errMessage));
    }
  }
}
