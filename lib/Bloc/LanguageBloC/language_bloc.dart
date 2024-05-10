import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<SelectLanguage>((event, emit) {
      emit(LangaugeSelected(selectedLanguage: event.selectedLanguage));
    });
  }
}
