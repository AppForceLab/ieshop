import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_events.dart';
part 'welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
