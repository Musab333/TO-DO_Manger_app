import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/constants/bloc_observer.dart';
import 'package:todo/shared/cache/cache_helper.dart';
import 'package:todo/todo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.sharedPreferences.getBool('onboarding') != null;
  //print(onBoarding);
  runApp(
    ToDoApp(
      onBoarding: onBoarding,
    ),
  );
}
