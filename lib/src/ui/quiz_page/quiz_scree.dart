import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/blocs/question_answer/qa_bloc.dart';
import 'package:quiz/src/resources/repository_imp.dart';
import 'package:quiz/src/ui/quiz_page/quiz.dart';
import 'package:quiz/src/utils/colors.dart';
import 'package:quiz/src/utils/text_style.dart';

class QuizScreen extends StatelessWidget {
  final int opcionMenu;
  const QuizScreen({Key key, this.opcionMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Preguntas"),
        ),
        body: RepositoryProvider(
            create: (context) => RepositoryImp(),
            child: BlocProvider(
              create: (context) {
                final repository =
                    RepositoryProvider.of<RepositoryImp>(context);
                return QABloc(repository)..add(LoadQAEvent(this.opcionMenu));
              },
              child: BlocBuilder<QABloc, QAState>(
                builder: (context, state) {
                  if (state is SuccessQAState) {
                    return Quiz(
                      questionAnswer: state.questionAnswer,
                    );
                  }
                  if (state is LoadingQAState) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: primaryColor,
                    ));
                  }
                  return Center(
                      child: Text(
                    "Error",
                    style: spamText1,
                  ));
                },
              ),
            )));
  }
}
