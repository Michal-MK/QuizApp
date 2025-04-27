import 'dart:io';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz/services/shared_preferences_storage.dart';

class LocalizationCubit extends Cubit<Locale> {
  final SharedPreferenceStorage sharedPreferences;

  late AppLocalizations l;

  LocalizationCubit(this.sharedPreferences, Locale? locale) : super(_getLocale(AppLocalizations.delegate, locale));

  Future<void> init() async {
    l = await AppLocalizations.delegate.load(state);
  }

  Future<void> english() async {
    await sharedPreferences.write(SharedPreferenceStorage.language, 'en');
    l = await AppLocalizations.delegate.load(const Locale('en'));
    emit(const Locale('en'));
  }

  Future<void> czech() async {
    await sharedPreferences.write(SharedPreferenceStorage.language, 'cs');
    l = await AppLocalizations.delegate.load(const Locale('cs'));
    emit(const Locale('cs'));
  }

  void toggle() {
    if (state.languageCode == 'en') {
      czech();
    } else {
      english();
    }
  }

  static String getDeviceLanguage() {
    return Platform.localeName.contains("_") ? Platform.localeName.split("_")[0] : Platform.localeName;
  }

  static Locale _getLocale(LocalizationsDelegate<AppLocalizations> delegate, [Locale? initialLocale]) {
    if (initialLocale != null) {
      return initialLocale;
    }
    return const Locale('en');
  }
}
