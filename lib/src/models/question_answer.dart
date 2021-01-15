class ModelQuestionAnswer {
  static String alphabet = 'abcdefghijklmnopqrstuvwxyz';
  final int id;
  final String pregunta;
  final Map<String, String> alternativas;
  final String clave;
  final String respuesta;
  String userAnswer;
  ModelQuestionAnswer(
      this.id, this.pregunta, this.alternativas, this.clave, this.respuesta);
  factory ModelQuestionAnswer.fromJson(Map<String, dynamic> json) {
    Map<String, String> answers = new Map();
    for (int i = 0; i < 3; i++) {
      answers[alphabet[i]] = json['alternativa_' + alphabet[i]] as String;
    }
    return ModelQuestionAnswer(json['id'] as int, json['pregunta'] as String,
        answers, json['clave'] as String, json['respuesta'] as String);
  }
}

class QuestionAnswer {
  final List<ModelQuestionAnswer> questionAnswer;
  int totalQuestion;
  double score;
  int correctAnswer;
  int incorrectAnswer;
  QuestionAnswer(this.questionAnswer);

  get getTotalQuestion {
    return questionAnswer.length;
  }

  get getScore {
    return this.score;
  }

  get getCorretAnswer {
    return this.correctAnswer;
  }

  get getIncorrectAnswer {
    return this.incorrectAnswer;
  }

  List<ModelQuestionAnswer> get getQuestionAnswer {
    return this.questionAnswer;
  }

  void checkResult() {
    int score = 0;
    for (final a in this.questionAnswer) {
      if (a.clave == a.userAnswer) {
        a.userAnswer = null;
        score++;
      } else {
        a.userAnswer =
            a.userAnswer == null ? 'vacio' : a.alternativas[a.userAnswer];
      }
    }
    this.correctAnswer = score;
    this.incorrectAnswer = questionAnswer.length - this.correctAnswer;
    this.score = score * 100 / questionAnswer.length;
  }
}
