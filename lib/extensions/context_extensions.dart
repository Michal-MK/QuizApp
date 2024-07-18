import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quiz/services/localization_cubit.dart';

extension ContextExtensions on BuildContext {
  LocalizationCubit get localization => read<LocalizationCubit>();

  AppLocalizations get l => AppLocalizations.of(this)!;
}
