import 'package:flutter/material.dart';

class QuestionController extends ChangeNotifier {
  int indexLiterature = 0;
  int indexSport = 0;
  int indexMath = 0;
  int indexHistory = 0;
  int indexMusic = 0;
  int indexScience = 0;

  int scoresLiterature = 0;
  int scoresSport = 0;
  int scoresMath = 0;
  int scoresHistory = 0;
  int scoresMusic = 0;
  int scoresScience = 0;

  int countLiterature = 0;
  int countSport = 0;
  int countMath = 0;
  int countHistory = 0;
  int countMusic = 0;
  int countScience = 0;

  void updateIndex(String val){
    if(val == "Văn học")indexLiterature++;
    if(val == "Thể thao")indexSport++;
    if(val == "Toán học")indexMath++;
    if(val == "Lịch sử")indexHistory++;
    if(val == "Âm nhạc")indexMusic++;
    if(val == "Khoa học")indexScience++;
    notifyListeners();
  }
  void updateScores(String val){
    if(val == "Văn học")scoresLiterature++;
    if(val == "Thể thao")scoresSport++;
    if(val == "Toán học")scoresMath++;
    if(val == "Lịch sử")scoresHistory++;
    if(val == "Âm nhạc")scoresMusic++;
    if(val == "Khoa học")scoresScience++;
    notifyListeners();
  }
  void resetScores(String val){
    if(val == "Văn học")scoresLiterature = 0 ;
    if(val == "Thể thao")scoresSport = 0;
    if(val == "Toán học")scoresMath = 0;
    if(val == "Lịch sử")scoresHistory = 0;
    if(val == "Âm nhạc")scoresMusic = 0;
    if(val == "Khoa học")scoresScience = 0;
    notifyListeners();
  }
  void updateCount(int val, String title){
    if(title == "Văn học")countLiterature = val;
    if(title == "Thể thao")countSport = val;
    if(title == "Toán học")countMath = val;
    if(title == "Lịch sử")countHistory = val;
    if(title == "Âm nhạc")countMusic = val;
    if(title == "Khoa học")countScience = val;
    notifyListeners();
  }
}