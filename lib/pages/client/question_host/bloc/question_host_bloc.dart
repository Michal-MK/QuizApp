import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_host_event.dart';
part 'question_host_state.dart';

class QuestionHostBloc extends Bloc<QuestionHostEvent, QuestionHostState> {
  QuestionHostBloc() : super(QuestionHostInitial()) {
    on<QuestionHostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
