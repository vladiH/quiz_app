import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quiz/src/blocs/question_answer/qa_bloc.dart';
import 'package:quiz/src/models/question_answer.dart';
import 'package:quiz/src/ui/quiz_page/percent_indicator.dart';
import 'package:quiz/src/utils/colors.dart';

class Question extends StatelessWidget {
  final int indexState;
  final String question;
  final Map<String, String> answer;
  Question(this.indexState, this.question, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              PercentIndicator(indexState),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Html(
                  data: question,
                ),
              )
            ]),
          ),
          Answer(answer: this.answer)
        ],
      ),
    );
  }
}

class Answer extends StatefulWidget {
  final Map<String, String> answer;
  Answer({Key key, this.answer}) : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  int contador = 0;
  int group;
  @override
  void initState() {
    group = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    contador = 0;
    return Container(
        color: Colors.transparent,
        height: 900,
        child: ListView.builder(
          itemCount: widget.answer.values.toList().length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColorOpacity, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: index == group ? complementaryColorOpacity : fadeColor,
                ),
                child: InkWell(
                  onTap: () => _onChanged(index),
                  child: Html(
                    data: widget.answer.values.toList()[index],
                    onImageTap: (_) {
                      _onChanged(index);
                    },
                  ),
                ));
          },
          scrollDirection: Axis.vertical,
        ));
  }

  void _onChanged(int val) {
    print(val);
    setState(() {
      group = val;
      BlocProvider.of<QABloc>(context).setRadiButtonIndex = val;
    });
  }
}

class Questions extends StatelessWidget {
  final int indexState;
  final QuestionAnswer questionAnswer;
  Questions(this.questionAnswer, this.indexState);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: IndexedStack(
        index: this.indexState,
        children: questionAnswer.questionAnswer.map((e) {
          return new Question(indexState, e.pregunta, e.alternativas);
        }).toList(),
      ),
    ));
  }
}

/**Column(
        children: widget.answer.values.map((val) {
          final row = Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Card(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey[100], width: 0.2)),
                  elevation: 0.4,
                  child: Column(
                    children: <Widget>[
                      Radio(
                          value: contador,
                          groupValue: group,
                          onChanged: _onChanged),
                      Html(data: val)
                    ],
                  )));
          contador++;
          return row;
        }).toList(),
      ),, */
