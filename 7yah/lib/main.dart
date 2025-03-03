import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah_app/shared/network/local/cache_helper.dart';
import 'package:hayah_app/shared/network/remote/dio_helper.dart';
import 'package:hayah_app/views/splash.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cubit/app/cubit.dart';
import 'cubit/app/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: "isDark");

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Inter",
          ),
          darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: HexColor('333739'),
              ),
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: HexColor('333739'),
              fontFamily: "Inter",
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  color: Colors.white,
                ),
              )),
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
