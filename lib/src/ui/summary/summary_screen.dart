import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/blocs/question_answer/qa_bloc.dart';
import 'package:quiz/src/ui/check_answer/check_answer_screem.dart';
import 'package:quiz/src/ui/home/home_screen.dart';
import 'package:quiz/src/utils/colors.dart';
import 'package:quiz/src/utils/text_style.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key key}) : super(key: key);
  Widget _card(String title, String description) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2)),
          dense: true,
          tileColor: complementaryColorOpacity,
          trailing: Text(
            description,
            style: subTitle1,
          ),
          leading: Icon(
            Icons.pie_chart,
            color: primaryColor,
          ),
          title: Text(
            title,
            style: title1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    BlocProvider.of<QABloc>(context).add(CheckQAEvent());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Resultados"),
      ),
      body: SafeArea(
        child: Scaffold(
          body: BlocBuilder<QABloc, QAState>(
            builder: (context, state) {
              if (state is SummaryQAState) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: height / 3,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: state.score >= 80
                                      ? AssetImage("./assets/images/happy.png")
                                      : AssetImage("./assets/images/sudor.png"),
                                )),
                          ),
                          _card("Total de preguntas",
                              state.totalQuestion.toString()),
                          _card("Puntaje", state.score.toString() + '%'),
                          _card(
                              "Respuestas correctas",
                              state.correctAnswer.toString() +
                                  "/" +
                                  state.totalQuestion.toString()),
                          _card(
                              "Respuestas Incorrectas",
                              state.incorrectAnswer.toString() +
                                  "/" +
                                  state.totalQuestion.toString()),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      color: tertiaryColor,
                                      child: Text(
                                        "Ir a inicio",
                                        style: buttonText,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      }),
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      color: primaryColor,
                                      child: Text(
                                        "Resultados",
                                        style: buttonText,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    BlocProvider.value(
                                                      value: BlocProvider.of<
                                                          QABloc>(context),
                                                      child:
                                                          CheckAnswerScreen(),
                                                    )));
                                      })
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
