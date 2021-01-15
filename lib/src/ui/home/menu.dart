import 'package:flutter/material.dart';
import 'package:quiz/src/models/menu.dart';
import 'package:quiz/src/ui/quiz_page/quiz_scree.dart';
import 'package:quiz/src/utils/text_style.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz",
        ),
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: menu.map((e) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black,
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: e.colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: GridTile(
                    footer: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          e.name,
                          style: buttonText,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                    opcionMenu: e.categoryId,
                                  ))),
                      child: Container(
                        margin: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    e.colors[0].withOpacity(0.05),
                                    BlendMode.srcOver),
                                alignment: Alignment.center,
                                image: e.image,
                                fit: BoxFit.fill)),
                      ),
                    )),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
