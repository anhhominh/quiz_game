
class HistoryModel {
  String? date;
  List<ItemHistoryModel> listItemHistory;
  HistoryModel({
    required this.date,
    required this.listItemHistory,
  });
}

class ItemHistoryModel {
  String? title;
  String? image;
  int? scores;
  ItemHistoryModel({
   required this.title,
   required this.image,
   required this.scores,
  });
}

List<ItemHistoryModel> listItemHistory = [];

List<HistoryModel> listHistory = [];

