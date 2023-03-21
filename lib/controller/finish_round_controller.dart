import 'package:flutter/cupertino.dart';

class FinishRoundController extends ChangeNotifier {

  bool finishLiterature = false;
  bool finishSport = false;
  bool finishMath = false;
  bool finishHistory = false;
  bool finishMusic = false;
  bool finishScience = false;
  void updateFinish(String val){
    if(val == "Văn học") finishLiterature = true;
    if(val == "Thể thao") finishSport = true;
    if(val == "Toán học") finishMath = true;
    if(val == "Lịch sử") finishHistory = true;
    if(val == "Âm nhạc") finishMusic = true;
    if(val == "Khoa học") finishScience = true;
    notifyListeners();
    notifyListeners();
  }
}