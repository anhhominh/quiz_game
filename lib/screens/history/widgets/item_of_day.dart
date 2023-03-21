import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled7/common/app_images.dart';
import 'package:untitled7/model/history_model.dart';
import '../../../common/app_vectors.dart';

// ignore: must_be_immutable
class ItemOfDay extends StatelessWidget {
  ItemOfDay({
    Key? key, required this.listItem
  }) : super(key: key);
  List<ItemHistoryModel> listItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listItem.length,
      itemBuilder:(context,index)
      =>  Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 200, 202, 206),
                spreadRadius: 0, // độ phân tán
                blurRadius: 5, // độ mờ
                offset: Offset(0,0), 
            )]
          ),
          margin: const EdgeInsets.only(bottom: 12,left: 5,right: 5),
          height: 84,
          width: MediaQuery.of(context).size.width * 340/390,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(listItem[index].image!,height: 62,width: 62,),
                  ),
                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listItem[index].title!,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                        for(int i = 0 ; i < listItem[index].scores! ; i++ )
                        SvgPicture.asset(star,height: 12,width: 12,),
                    ],
                  ),
                ],
              ),
                ],
              ),),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${listItem[index].scores!*20} điểm", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                    ],
                  ),
              )
            ],
          ),
        ),
    );
  }
}