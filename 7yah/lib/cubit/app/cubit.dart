import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah_app/cubit/app/states.dart';

import '../../models/login_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: "isDark", value: isDark)
          .then((value) => emit(AppChangeModeState()));
    }
  }

  LoginModel? userModel;

  void getUserData() {
    emit(LoadingUserDataState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel!.data!.name);
      emit(SuccessUserDataState(userModel!));
    }).catchError((error) {
      emit(ErrorUserDataState());
    });
  }
}
