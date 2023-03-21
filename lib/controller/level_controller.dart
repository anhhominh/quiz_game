import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class LevelController extends ChangeNotifier {
  final box = GetStorage();
  bool get isLevelEasy => box.read('dễ') ?? false;
  bool get isLevelMedium => box.read('trung bình') ?? false;
  String get level => isLevelEasy ? "dễ" : isLevelMedium ? "trung bình" : "khó";
  void changeLevelEasy(bool val) {
    box.write('dễ', val);
    notifyListeners();
  }
  void changeLevelMedium(bool val) {
    box.write('trung bình', val);
    notifyListeners();
  }
}