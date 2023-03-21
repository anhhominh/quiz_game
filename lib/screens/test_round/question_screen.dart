import 'package:flutter/material.dart';
import 'package:untitled7/screens/test_round/test_round.dart';
import 'package:untitled7/screens/test_round/widgets/answer_button.dart';

import '../../common/app_colors.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    Key? key,
    required this.widget,
    required this.index,
  }) : super(key: key);

  final TestRoundScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Câu ${(widget.questionAnswer[index].numberQuestion!%5 + 1)}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
        ),
        const SizedBox(height: 4,),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Text(widget.questionAnswer[index].question!,style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
        ),
        Center(
          child: Image.asset(widget.image,
          height: MediaQuery.of(context).size.width * 230/390,
          width: MediaQuery.of(context).size.height *219/844,),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*61/844,),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*27/390,right: MediaQuery.of(context).size.width*27/390),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnswerButton(
                    answer: widget.questionAnswer[index].answerA,
                    colorButton: buttonA, 
                    answerRight: widget.questionAnswer[index].answerRight, 
                    index: index,title: widget.title,),
                  SizedBox(width: MediaQuery.of(context).size.width*20/390,),
                  AnswerButton(
                    answer: widget.questionAnswer[index].answerB,
                    colorButton: buttonB, 
                    answerRight: widget.questionAnswer[index].answerRight, 
                    index: index,title: widget.title,),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*31/844,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnswerButton(
                    answer: widget.questionAnswer[index].answerC,
                    colorButton: buttonC, 
                    answerRight: widget.questionAnswer[index].answerRight, 
                    index: index, title: widget.title,),
                  SizedBox(width: MediaQuery.of(context).size.width*20/390,),
                  AnswerButton(
                    answer: widget.questionAnswer[index].answerD,
                    colorButton: buttonD, 
                    answerRight: widget.questionAnswer[index].answerRight, 
                    index: index,title: widget.title,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}