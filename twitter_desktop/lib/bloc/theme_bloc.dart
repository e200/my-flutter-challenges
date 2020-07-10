import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(true);

  @override
  Stream<bool> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is DarkTheme) {
      yield true;
    } else {
      yield false;
    }
  }
}
