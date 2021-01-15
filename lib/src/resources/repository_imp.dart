import 'dart:convert';

import 'package:http/http.dart';
import 'package:quiz/src/models/question_answer.dart';
import 'package:quiz/src/resources/api.dart';
import 'package:quiz/src/resources/repository.dart';

class RepositoryImp extends Repository {
  @override
  Future<QuestionAnswer> questionAnswer(int opcionMenu) async {
    final Response response = await quizApiProvider.getQuizData(opcionMenu);
    final list = jsonDecode(response.body) as List;
    List<ModelQuestionAnswer> listQuestionAnswer =
        list.map((e) => ModelQuestionAnswer.fromJson(e)).toList();
    QuestionAnswer questionAnswer = new QuestionAnswer(listQuestionAnswer);
    return questionAnswer;
  }
}
