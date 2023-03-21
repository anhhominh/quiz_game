import 'package:flutter/material.dart';
import 'package:untitled7/model/select_card_model.dart';
import 'package:untitled7/screens/test_round/test_round.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({
    Key? key,
    required this.x, required this.choice,
  }) : super(key: key);

  final double x;
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) 
          => TestRoundScreen(
            title: choice.title, 
            image: choice.image, 
            questionAnswer: choice.questionAndAnswer,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 200, 202, 206),
              spreadRadius: 0, // độ phân tán
              blurRadius: 5, // độ mờ
              offset: Offset(0,0), // changes position of shadow
            ),
          ]
        ),
        height: 160/390*x,
        width: 160/390*x,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(choice.image,height: 85,),
            Text(choice.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Theme.of(context).iconTheme.color),),
          ],
        ),
      ),
    );
  }
}