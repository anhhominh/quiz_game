
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/controller/level_controller.dart';
import 'package:untitled7/controller/theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isChecked = false;
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
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios)),
          title: Text("CÀI ĐẶT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).iconTheme.color)),
          centerTitle: true,
        ),
          body: Container(
            margin: EdgeInsets.zero,
            //color: Theme.of(context).backgroundColor,
            child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 16,bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: y*20/844,),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text("Chủ đề",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                         context.read<ThemeController>().toggleTheme(false);
                      }, 
                      icon: !context.watch<ThemeController>().isDarkMode ? const Icon(Icons.check_box,color: Color(0xff71B2AB),) : const Icon(Icons.check_box_outline_blank)),
                      Text("Sáng",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                         context.read<ThemeController>().toggleTheme(true);
                      }, 
                      icon: context.watch<ThemeController>().isDarkMode ? const Icon(Icons.check_box,color: Color(0xff71B2AB),) : const Icon(Icons.check_box_outline_blank)),
                      Text("Tối",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Thay đổi cấp độ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        context.read<LevelController>().changeLevelEasy(true);
                        context.read<LevelController>().changeLevelMedium(false);
                      }, 
                      icon: context.watch<LevelController>().level == "dễ" ? const Icon(Icons.check_box, color: Color(0xff71B2AB),) : const Icon(Icons.check_box_outline_blank)),
                    Text("Dễ",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        context.read<LevelController>().changeLevelEasy(false);
                        context.read<LevelController>().changeLevelMedium(true);
                      }, 
                      icon: context.watch<LevelController>().level == "trung bình" ? const Icon(Icons.check_box, color: Color(0xff71B2AB),) :  const Icon(Icons.check_box_outline_blank)),
                    Text("Trung bình",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        context.read<LevelController>().changeLevelEasy(false);
                        context.read<LevelController>().changeLevelMedium(false);
                      }, 
                      icon: context.watch<LevelController>().level != "trung bình" && context.watch<LevelController>().level != "dễ" ? const Icon(Icons.check_box, color: Color(0xff71B2AB),) : Icon(Icons.check_box_outline_blank)),
                    Text("Khó",style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hướng dẫn",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                      SizedBox(height: 10,),
                      Text("Mỗi vòng gồm 5 câu hỏi. Bạn phải chọn đáp án thì mới chuyển qua câu tiếp theo. Chúc bạn có kết quả thi thật tốt!",
                      style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                    ],
                  ),
                ),              
              ],
            ),
          ),
        ),
          ),
    );
  }
}