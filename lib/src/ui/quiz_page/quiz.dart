import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/blocs/index_stack/index_stack_bloc.dart';
import 'package:quiz/src/blocs/question_answer/qa_bloc.dart';
import 'package:quiz/src/models/question_answer.dart';
import 'package:quiz/src/ui/quiz_page/questions.dart';
import 'package:quiz/src/ui/summary/summary_screen.dart';
import 'package:quiz/src/utils/colors.dart';
import 'package:quiz/src/utils/text_style.dart';

class Quiz extends StatelessWidget {
  final QuestionAnswer questionAnswer;
  const Quiz({Key key, this.questionAnswer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: BlocProvider(
            create: (context) =>
                IndexStackBloc(this.questionAnswer.getTotalQuestion),
            child: BlocBuilder<IndexStackBloc, int>(
              builder: (context, state) {
                final end = context.select((IndexStackBloc value) => value.end);
                return Stack(
                  children: <Widget>[
                    Container(
                      height: height / 3,
                      color: primaryColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Questions(questionAnswer, state),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: state == end - 1
                                  ? tertiaryColor
                                  : primaryColor,
                              child: state == end - 1
                                  ? Text("Resultado", style: buttonText)
                                  : Text("Siguiente", style: buttonText),
                              onPressed: () {
                                if (state < end) {
                                  context.read<QABloc>().setUserResponse(state);
                                  context
                                      .read<IndexStackBloc>()
                                      .add(NextIndexStack());
                                  if (state == end - 1) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => BlocProvider.value(
                                                  value:
                                                      BlocProvider.of<QABloc>(
                                                          context),
                                                  child: SummaryScreen(),
                                                )));
                                  }
                                }
                              })
                        ],
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
