import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/src/models/question_answer.dart';
import 'package:quiz/src/resources/repository.dart';
part 'qa_event.dart';
part 'qa_state.dart';

class QABloc extends Bloc<QAEvent, QAState> {
  final _chars = 'abcdefghijklmnopqrstuvwxyz';
  final Repository repository;
  QuestionAnswer questionAnswer;
  int _indexRadioButton = -1;
  QABloc(this.repository) : super(LoadingQAState());

  @override
  Stream<QAState> mapEventToState(QAEvent event) async* {
    if (event is LoadQAEvent) {
      yield* _mapLoadQAEventToState(event);
    }
    if (event is CheckQAEvent) {
      yield* _mapCheckQAEventToState();
    }
  }

  Stream<QAState> _mapLoadQAEventToState(LoadQAEvent event) async* {
    yield LoadingQAState();
    questionAnswer = await repository.questionAnswer(event.opcionMenu);
    if (questionAnswer != null) {
      yield SuccessQAState(questionAnswer);
    } else {
      yield ErrorQAState("error");
    }
  }

  Stream<QAState> _mapCheckQAEventToState() async* {
    questionAnswer.checkResult();
    yield SummaryQAState(
        questionAnswer.getTotalQuestion,
        questionAnswer.getScore,
        questionAnswer.getCorretAnswer,
        questionAnswer.getIncorrectAnswer);
  }

  void setUserResponse(int id) {
    questionAnswer.questionAnswer[id].userAnswer = this._indexRadioButton != -1
        ? this._chars[this._indexRadioButton]
        : null;
    this._indexRadioButton = -1;
  }

  set setRadiButtonIndex(int index) {
    this._indexRadioButton = index;
  }
}
