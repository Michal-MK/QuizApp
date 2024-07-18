import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/pages/client/home/cubit/home_cubit.dart';
import 'package:quiz/pages/server/add_question/add_question_vm.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/services/localization_cubit.dart';
import 'package:quiz/services/shared_preferences_service.dart';
import 'package:quiz/pages/server/question_management/question_management_vm.dart';

class DI {
  static late GetIt instance;

  static Future<void> init(GetIt getIt) async {
    instance = getIt;

    getIt.registerSingleton(SharedPreferenceStorage());

    getIt.registerSingleton(LocalizationCubit(get(), const Locale('en')));

    getIt.registerSingleton(QuestionDatabase());
    getIt.registerSingleton(QuestionRepo(get()));
    getIt.registerSingleton(QuestionService());

    getIt.registerFactory(() => HomePaneVM(get(), get()));
    getIt.registerFactory(() => AddQuestionVM(get()));
    getIt.registerFactory(() => QuestionManagementVM(get()));

    getIt.registerFactory(() => HomeCubit());
  }

  static T get<T extends Object>() {
    return instance.get<T>();
  }
}
