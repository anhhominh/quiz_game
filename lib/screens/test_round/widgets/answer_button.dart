// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/controller/question_controller.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({
    Key? key, required this.answer, required this.colorButton,required this.answerRight,required this.index, required this.title}) : super(key: key);
  String? answer;
  Color? colorButton;
  String? answerRight;
  int index;
  String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: colorButton,
      minimumSize: Size(MediaQuery.of(context).size.width*150/390, MediaQuery.of(context).size.height*42/844),
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),),
      onPressed: (){
        context.read<QuestionController>().updateIndex(title);
        int tmp = index%5;
        context.read<QuestionController>().updateCount(tmp,title);
        if(answer! == answerRight) context.read<QuestionController>().updateScores(title);
      },
      child: Text(answer!,style: const TextStyle(fontSize: 14,color: Colors.white),),
    );
  }
}