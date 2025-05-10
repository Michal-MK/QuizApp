import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/services/localization_cubit.dart';
import 'package:quiz/services/shared_preferences_storage.dart';

class SettingsVM extends ChangeNotifier {
  final SharedPreferenceStorage sharedPreferenceStorage;

  SettingsVM(this.sharedPreferenceStorage);

  void setLanguage(String? value) {
    if (value == null) return;
    
    if (value == 'en') {
      GetIt.I.get<LocalizationCubit>().english();
    } else if (value == 'cs') {
      GetIt.I.get<LocalizationCubit>().czech();
    }
    notifyListeners();
  }
}
