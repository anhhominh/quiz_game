import 'package:flutter/material.dart';
import 'package:untitled7/screens/home/widgets/button_menu.dart';
import 'package:untitled7/screens/home/widgets/select_card.dart';
import '../../model/select_card_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width; 
    var y = MediaQuery.of(context).size.height; 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text("QUIZ GAME",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).iconTheme.color)),
          centerTitle: true,
          leading: ButtonMenu(x: x, y: y),),
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: y*20/844,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: RichText(
                  text: TextSpan(
                    text: "Let's go!",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,color: Theme.of(context).iconTheme.color),
                    children: const <TextSpan>[
                      TextSpan(text: "\nVừa học vừa chơi nhận bao kiến thức!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: y*21/844,),
              Expanded(
                child: GridView.count(
                    physics: y >= 700 ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
                    padding: const EdgeInsets.all(5),
                    crossAxisSpacing: x*17/390,
                    mainAxisSpacing: x*17/390,
                    crossAxisCount: 2,
                    children: List.generate(choices.length, (index) {  
                  return Center(  
                    child: SelectCard(choice: choices[index], x: x,key: ValueKey(choices[index].title),),  
                  );  
                }  
                  ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}



