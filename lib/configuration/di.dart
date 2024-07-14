import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:quiz/pages/client/home/cubit/home_cubit.dart';
import 'package:quiz/services/localization_cubit.dart';
import 'package:quiz/services/shared_preferences_service.dart';

class DI {
  static late GetIt instance;

  static bool isReviewEnvironment = false;

  static Future<void> init(GetIt getIt) async {
    instance = getIt;

    getIt.registerSingleton(SharedPreferenceStorage());

    getIt.registerSingleton(LocalizationCubit(get(), const Locale('en')));

    getIt.registerFactory(() => HomeCubit());
  }

  static T get<T extends Object>() {
    return instance.get<T>();
  }
}