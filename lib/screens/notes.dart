import 'package:flutter/material.dart';
import 'package:main_app/data/question_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  Color mainColor = const Color(0xFF071D36);
  Color secondColor = const Color(0xFF0D121F);
  
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color rightAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  Color btnColor =  const Color(0xFF0D121F);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              // ignore: unused_label
              isPressed: false;
            });
          },
          itemCount: question.length,
          itemBuilder: (context, index) {
            
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text("Question ${index + 1} / ${question.length}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                      )
                    ),
                  ),
                  const Divider(
                    color: Colors.white70,
                    height: 2.0,
                    thickness: 3.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(question[index].question!, 
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28.0,
                  ),
                ),
                  const SizedBox(
                    height: 35,
                  ),
                  for(int i = 0; i<question[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin:  const EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      hoverColor: const Color.fromARGB(255, 36, 113, 130),
                      shape: const StadiumBorder(),
                      color: isPressed?
                        question[index].answers!.entries.toList()[i].value
                            ? rightAnswer
                            :wrongAnswer
                          :secondColor,
                      padding:  const EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed 
                      ? (){}
                      :(){
                       setState(() {
                         isPressed = true;
                       });
                       if(question[index]
                          .answers!
                          .entries
                          .toList()[i]
                          .value) {
                            score +=10;
                       } 
                      },
                      child: Text(question[index].answers!.keys.toList()[i],
                      style: const TextStyle(
                         color: Colors.white,
                        ),
                  
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 50),
                      OutlinedButton(
                      onPressed: isPressed 
                        ?() {
                            _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      }: null,
                        child: const Text("Next Question",
                        style: TextStyle(
                          color: Colors.white,
                          ),
                        )
                      ),
                    ],
                  ),
              ],  
            );
          },
        ),
      ),
    );
  }
}