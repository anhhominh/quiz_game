import 'package:flutter/material.dart';
import 'package:untitled7/screens/discover/discover_screen.dart';
import 'package:untitled7/screens/history/history_screen.dart';
import 'package:untitled7/screens/settings/settings.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon :const Icon(Icons.menu), 
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Container(
          padding: const EdgeInsets.only(left: 20),
          margin: EdgeInsets.only(
            left: 16, 
            right: 170*x/390,
            top: AppBar().preferredSize.height, // độ cao của AppBar(),
            bottom: y - AppBar().preferredSize.height - y*200/844,
            ),
          width: x*204/390,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()));
                  },
                  child:Row(
                  children: [
                  const Icon(Icons.history),
                  const SizedBox(width: 8,),
                  Text("Lịch sử",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                ],), 
                ),
              const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const SettingsScreen())));
                  },
                  child: Row(
                    children: [
                    const Icon(Icons.settings),
                    const SizedBox(width: 8,),
                    Text("Cài đặt",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                  ],),
                ),
              const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoverScreen()));
                  },
                  child: Row(
                    children: [
                    const Icon(Icons.search_outlined),
                    const SizedBox(width: 8,),
                    Text("Khám phá",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                  ],),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
