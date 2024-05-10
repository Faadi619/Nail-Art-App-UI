part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

final class SelectLanguage extends LanguageEvent {
  final String selectedLanguage;
  SelectLanguage({
    required this.selectedLanguage,
  });
}
