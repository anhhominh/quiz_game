import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/controller/finish_round_controller.dart';
import 'package:untitled7/model/history_model.dart';
import 'package:untitled7/screens/home/home_screen.dart';

import '../../common/app_images.dart';
import '../../common/app_vectors.dart';
import '../../controller/question_controller.dart';

// ignore: must_be_immutable
class RoundResultsScreen extends StatelessWidget {
  RoundResultsScreen({
    Key? key,required this.scores, required this.title, required this.length, required this.index, required this.image, required this.finish
  }) : super(key: key);
  int? scores;
  String title;
  int length;
  int index;
  String image;
  bool finish;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 47/844,),
            Text(scores! != 0 ? "CHÚC MỪNG!" : "THẬT ĐÁNG TIẾC!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
            const SizedBox(height: 8,),
            Image.asset(scores! != 0 ? cup : sad,
            width: MediaQuery.of(context).size.width * 256/390,
            height: MediaQuery.of(context).size.width * 256/390,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0 ; i < scores! ; i++)
                SvgPicture.asset(star,height: 12,width: 12,), 
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 47/844,),
            Text("Điểm ${scores!*20}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
            SizedBox(height: MediaQuery.of(context).size.height * 54/844,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width*150/390, MediaQuery.of(context).size.height*42/844),
              padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),),
              onPressed: (){
                if(finish == false){
                  final now = DateTime.now();
                  String formatter = DateFormat('dd/MM/yyyy').format(now);
                  // print(formatter);
                  listItemHistory.add(ItemHistoryModel(title: title, image: image, scores: scores));
                  listHistory.replaceRange(0,listHistory.length,[HistoryModel(date: formatter, listItemHistory: listItemHistory)]);
                }
                if(length - index> 5) {
                  context.read<QuestionController>().updateCount(0,title);
                  context.read<QuestionController>().resetScores(title);
                }
                else { showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('THÔNG BÁO',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                          content: const Text('Bạn đã làm hết bài của vòng thi này!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                context.read<FinishRoundController>().updateFinish(title);
                                Navigator.pop(context, 'OK');
                                Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (c) => const HomeScreen()),(route) => false);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                  ),);
                }
              },
              child: const Text("TIẾP TỤC THỬ SỨC",style: TextStyle(fontSize: 14,color: Colors.white),),
            ),
          ],
        )
    );
  }
}


