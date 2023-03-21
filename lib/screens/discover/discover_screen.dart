import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
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
          title: Text("KHÁM PHÁ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).iconTheme.color)),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          child: ListView(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: MediaQuery.of(context).size.height * 20/844,),
                const Text("Khoa học",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff15AA47)),),
                const SizedBox(height: 8,),
                Text("Chuyển động của các hành tinh",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                const SizedBox(height: 8,),
                Text('''Sau những quan sát suốt hơn 1000 năm từ khoảng năm 2000 đến 500 trước Công nguyên, con người nhận ra một điều rằng bầu trời trên đầu chúng ta không hề đứng yên. Nó di chuyển hàng ngày với những chu kỳ nhất định.\n
Nó bắt đầu hé lộ rằng ngoài Trái đất còn có các thiên thể khác, các hành tinh trong cùng một hệ với chúng ta và các ngôi sao khác cố định trên thiên cầu nhưng cũng hàng ngày di chuyển theo chu kỳ. Mô hình địa tâm (geocentric) của Ptolemy được ra đời chính trên cơ sở của quan sát này.''',
                style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),)
                  ],
               ),
                const SizedBox(height: 8,),
                Text("Chuyển động của Trái đất trong Hệ Mặt trời",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                Text('''Năm 1543, Nicolaus Copernicus đưa ra mô hình nhật tâm (Heliocentric) cho biết Mặt trời mới là thiên thể cố định, còn Trái đất chỉ là một hành tinh chuyển động quanh nó cũng như các hành tinh trong hệ là sao Thủy, sao Kim, sao Hỏa, sao Mộc và sao Thổ.''',
                style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
                const SizedBox(height: 8,),
                Text("Quỹ đạo elip của các hành tinh",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),),
                Text('''Trong những năm 1605-1609, Johanne Kepler đã đi xa hơn Copernicus bằng việc đưa chuyển động của các hành tinh trong Hệ Mặt trời vào một mô hình toán học thay vì chỉ mang tính mô tả. Các định luật của Kepler đã cho biết các hành tinh chuyển động quanh Mặt trời theo quỹ đạo elip với những chu kỳ khác nhau.''',
                style: TextStyle(fontSize: 14,color: Theme.of(context).iconTheme.color),),
            ]
          ),
        ),
      )
    );
  }
}