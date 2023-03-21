// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/controller/finish_round_controller.dart';
import 'package:untitled7/controller/question_controller.dart';
import 'package:untitled7/screens/home/home_screen.dart';
import 'package:untitled7/screens/test_round/question_screen.dart';
import '../../model/history_model.dart';
import '../../model/question_answer.dart';
import 'round_results_screen.dart';


class TestRoundScreen extends StatefulWidget {
  TestRoundScreen({Key? key,required this.title, required this.image,required this.questionAnswer}) : super(key: key);
  String title;
  String image;
  List<QuestionAndAnswer> questionAnswer;
  @override
  State<TestRoundScreen> createState() => _TestRoundScreenState();
}

class _TestRoundScreenState extends State<TestRoundScreen> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
    var scores = 0;
    var count = 0;
    bool finish = false;
    if(widget.title == "Văn học"){
      index = context.watch<QuestionController>().indexLiterature;
      scores = context.watch<QuestionController>().scoresLiterature;
      count = context.watch<QuestionController>().countLiterature;
      finish = context.watch<FinishRoundController>().finishLiterature;
    }
    if(widget.title == "Thể thao"){
      index = context.watch<QuestionController>().indexSport;
      scores = context.watch<QuestionController>().scoresSport;
      count = context.watch<QuestionController>().countSport;
      finish = context.watch<FinishRoundController>().finishSport;
    }
    if(widget.title == "Toán học"){
      index = context.watch<QuestionController>().indexMath;
      scores = context.watch<QuestionController>().scoresMath;
      count = context.watch<QuestionController>().countMath;
      finish = context.watch<FinishRoundController>().finishMath;
    }
    if(widget.title == "Âm nhạc"){
      index = context.watch<QuestionController>().indexMusic;
      scores = context.watch<QuestionController>().scoresMusic;
      count = context.watch<QuestionController>().countMusic;
      finish = context.watch<FinishRoundController>().finishMusic;
    }
    if(widget.title == "Khoa học"){
      index = context.watch<QuestionController>().indexScience;
      scores = context.watch<QuestionController>().scoresScience;
      count = context.watch<QuestionController>().countScience;
      finish = context.watch<FinishRoundController>().finishScience;
    }
    if(widget.title == "Lịch sử"){
      index = context.watch<QuestionController>().indexHistory;
      scores = context.watch<QuestionController>().scoresHistory;
      count = context.watch<QuestionController>().countHistory;
      finish = context.watch<FinishRoundController>().finishHistory;
    }

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue 
        context: context,
        builder: (context) =>  AlertDialog(
          title: const Text('CẢNH BÁO',style: TextStyle(color: Color(0xffFF0000),fontWeight: FontWeight.bold,fontSize: 20),),
          content: const Text('Bạn muốn thoát ra khỏi vòng thi hiện tại?'),
          actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
            backgroundColor: const Color(0xffDEE1E6),
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(fontSize: 14),
          ),
            onPressed: () => Navigator.pop(context, 'Không'),
            child: const Text('Không',style: TextStyle(color: Colors.black),),
          ),
          TextButton(
            style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(fontSize: 14),
          ),
            onPressed: () {
              if((count + 1) == 5 && finish == false){
                final now = DateTime.now();
                String formatter = DateFormat('dd/MM/yyyy').format(now);
                // print(formatter);
                // print(widget.image);
                listItemHistory.add(ItemHistoryModel(title: widget.title, image: widget.image, scores: scores));
                listHistory.replaceRange(0,listHistory.length,[HistoryModel(date: formatter, listItemHistory: listItemHistory)]);
              }  
              Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => const HomeScreen()),(route) => false);
          },
            child: const Text('Có',style: TextStyle(color: Colors.white),),
          ),
            SizedBox(width: MediaQuery.of(context).size.width*10/390,),
            ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }
    return SafeArea(
      child: WillPopScope( 
      onWillPop: showExitPopup,
      child: Scaffold( // màn hình hiện câu hỏi lần lượt
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
            leading: IconButton(
              onPressed: (){
                showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                title: const Text('CẢNH BÁO',style: TextStyle(color: Color(0xffFF0000),fontWeight: FontWeight.bold,fontSize: 20),),
                content: const Text('Bạn muốn thoát ra khỏi vòng thi hiện tại?'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffDEE1E6),
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                  onPressed: () => Navigator.pop(context, 'Không'),
                  child: const Text('Không',style: TextStyle(color: Colors.black),),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                  onPressed: () {
                    if((count + 1) == 5 && finish == false){
                      final now = DateTime.now();
                      String formatter = DateFormat('dd/MM/yyyy').format(now);
                      // print(formatter);
                      // print(widget.image);
                      listItemHistory.add(ItemHistoryModel(title: widget.title, image: widget.image, scores: scores));
                      listHistory.replaceRange(0,listHistory.length,[HistoryModel(date: formatter, listItemHistory: listItemHistory)]);
                    }  
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (c) => const HomeScreen()),(route) => false);
                },
                  child: const Text('Có',style: TextStyle(color: Colors.white),),
                ),
                  SizedBox(width: MediaQuery.of(context).size.width*10/390,),
                  ],
                ),);
              }, 
                icon: const Icon(Icons.arrow_back_ios)),
                title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).iconTheme.color)),
                centerTitle: true,
              ),
                body: (count + 1) == 5  ? RoundResultsScreen(scores: scores,title: widget.title, length: widget.questionAnswer.length, index: index, image: widget.image, finish: finish,): QuestionScreen(widget: widget, index: index),
          )
        ),
      );
  }
}



