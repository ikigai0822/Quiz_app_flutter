import 'package:flutter/material.dart';
import 'package:main_app/data/question_list.dart';
import 'package:main_app/screens/result_screen.dart';
import 'package:main_app/ui/shared/color.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == question.length - 1) {
                setState(() {
                  btnText = "See Results";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/10",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Text(
                      "${question[index].question}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  for (int i = 0; i < question[index].answers!.length; i++)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      margin: EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed
                            ? question[index].answers!.values.toList()[i]
                                ? Colors.green
                                : Colors.red
                            : AppColor.secondaryColor,
                        onPressed: !answered
                            ? () {
                                if (question[index]
                                    .answers!
                                    .values
                                    .toList()[i]) {
                                  score++;
                                  print("yes");
                                } else {
                                  print("no");
                                }
                                setState(() {
                                  btnPressed = true;
                                  answered = true;
                                });
                              }
                            : null,
                        child: Text(question[index].answers!.keys.toList()[i],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == question.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(score)));
                      } else {
                        _controller!.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);

                        setState(() {
                          btnPressed = false;
                        });
                      }
                    },
                    shape: StadiumBorder(),
                    fillColor: Colors.blue,
                    padding: EdgeInsets.all(18.0),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
            itemCount: question.length,
          )),
    );
  }
}