import 'package:quiz/src/models/question_answer.dart';

abstract class Repository {
  Future<QuestionAnswer> questionAnswer(int opcionMenu);
}
