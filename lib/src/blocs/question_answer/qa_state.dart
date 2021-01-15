part of 'qa_bloc.dart';

abstract class QAState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingQAState extends QAState {}

class SuccessQAState extends QAState {
  final QuestionAnswer questionAnswer;
  SuccessQAState(this.questionAnswer);
  @override
  List<Object> get props => [questionAnswer];
}

class ErrorQAState extends QAState {
  final String error;
  ErrorQAState(this.error);
  @override
  List<Object> get props => [error];
}

class SummaryQAState extends QAState {
  final int totalQuestion;
  final double score;
  final int correctAnswer;
  final int incorrectAnswer;
  SummaryQAState(
      this.totalQuestion, this.score, this.correctAnswer, this.incorrectAnswer);
  @override
  List<Object> get props =>
      [totalQuestion, score, correctAnswer, incorrectAnswer];
}
