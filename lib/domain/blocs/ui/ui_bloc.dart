import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(UiInitial()) {
    on<UiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
