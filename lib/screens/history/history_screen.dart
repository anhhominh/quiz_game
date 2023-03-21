import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled7/model/history_model.dart';
import 'package:untitled7/screens/history/widgets/item_of_day.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
          title: Text("LỊCH SỬ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).iconTheme.color)),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 22),
          child: ListView.builder(
            itemCount: listHistory.length,
            itemBuilder: (context, index){
              return listHistory.isNotEmpty ? ItemHistory(historyModel: listHistory.elementAt(index),): Center(child: Text("Chưa có lịch sử để hiển thị.", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),);
            } )),
        ),
      );
  }
}

// ignore: must_be_immutable
class ItemHistory extends StatelessWidget {
  ItemHistory({
    Key? key,required this.historyModel,
  }) : super(key: key);
  HistoryModel historyModel;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat('dd/MM/yyyy').format(now);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( historyModel.date! == formatter ? "Hôm nay" : historyModel.date!, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
        const SizedBox(height: 12,),       
        SizedBox(
          height: 96*historyModel.listItemHistory.length.toDouble(),
          child: ItemOfDay(listItem: historyModel.listItemHistory,)),
      ],
    );
  }
}

