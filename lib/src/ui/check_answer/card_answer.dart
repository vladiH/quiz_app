import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quiz/src/ui/common/counter_text.dart';
import 'package:quiz/src/utils/colors.dart';
import 'package:quiz/src/utils/text_style.dart';

class CardAnswer extends StatelessWidget {
  final int number;
  final String question;
  final String answer;
  final String userAnswer;
  const CardAnswer(
      {this.number, this.question, this.answer, this.userAnswer, Key key})
      : super(key: key);
  bool get _userAnswerIsEmpty {
    return userAnswer == null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight, child: CounterText(number)),
                Html(
                  data: question,
                ),
                SizedBox(
                  height: 10,
                ),
                _userAnswerIsEmpty
                    ? Container(
                        color: complementaryColor,
                        child: Html(data: answer),
                      )
                    : Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: secondaryColor,
                              child: Html(
                                data: userAnswer,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              child: Text(
                                "Tu respuesta deberia ser:",
                                style: subText,
                              ),
                            ),
                            Container(
                              color: complementaryColor,
                              child: Html(
                                data: answer,
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
