import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/blocs/question_answer/qa_bloc.dart';
import 'package:quiz/src/ui/check_answer/card_answer.dart';

class CheckAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int number = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Revision"),
      ),
      body: BlocBuilder<QABloc, QAState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                  children: context
                      .watch<QABloc>()
                      .questionAnswer
                      .getQuestionAnswer
                      .map((e) {
                return CardAnswer(
                  number: ++number,
                  question: e.pregunta,
                  answer: e.respuesta,
                  userAnswer: e.userAnswer,
                );
              }).toList()),
            ),
          );
        },
      ),
    );
  }
}
