part of 'language_bloc.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class LangaugeSelected extends LanguageState {
  final String selectedLanguage;

  LangaugeSelected({required this.selectedLanguage});
}
