import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/controller/finish_round_controller.dart';
import 'package:untitled7/controller/level_controller.dart';
import 'package:untitled7/controller/question_controller.dart';
import 'package:untitled7/screens/home/home_screen.dart';

import 'controller/theme_controller.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MultiProvider(
            providers: [
            ChangeNotifierProvider(create: (context) => ThemeController()),
            ],
            child: Consumer<ThemeController>(
              builder: (context, themeController, Widget? widget) {
                return MaterialApp(
                    themeMode: themeController.theme,
                    theme: MyThemes.lightTheme,
                    darkTheme: MyThemes.darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: const Splash());
              }
           ),);
        } else {
          // Loading is done, return the app:
         return MultiProvider(
            providers: [
            ChangeNotifierProvider(create: (context) => ThemeController()),
            ChangeNotifierProvider(create: (context) => LevelController()),
            ChangeNotifierProvider(create: (context) => QuestionController()),
            ChangeNotifierProvider(create: (context) => FinishRoundController()),
            ],
            child: Consumer<ThemeController>(
              builder: (context, themeController, Widget? widget) {
                return MaterialApp(
                    themeMode: themeController.theme,
                    theme: MyThemes.lightTheme,
                    darkTheme: MyThemes.darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: const HomeScreen());
              }));
        }
      }
    );
}
}
        

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic x = MediaQuery.of(context).size.width; 
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor:  Colors.transparent,));
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBodyBehindAppBar: true,
          body:Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("QUIZ GAME",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                  Image.asset('assets/image/fabulous-quiz-1.png',width: x*0.66,height: x*0.66),
                ],
              )
      ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 6));
  }
}

