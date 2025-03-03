import '../../models/login_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeModeState extends AppStates {}

class LoadingHomeState extends AppStates {}

class SuccessHomeState extends AppStates {}

class ErrorHomeState extends AppStates {}

class LoadingUserDataState extends AppStates {}

class SuccessUserDataState extends AppStates {
  final LoginModel loginModel;

  SuccessUserDataState(this.loginModel);
}

class ErrorUserDataState extends AppStates {}
