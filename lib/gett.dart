import 'package:flutter/material.dart';
import 'package:get/get.dart';

class classsget extends StatelessWidget {
  myclasss mm = Get.put(myclasss());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Column(children: [
        Container(
          child: TextField(
            controller: t1,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        Container(
          child: TextField(
            controller: t2,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        ElevatedButton(
            onPressed: () {

              String v1 = t1.text;
              String v2 = t2.text;
              mm.mysum(v1, v2);
            },
            child: Text("submit")),
        Obx(
          () => Text("SUM====${mm.sum.value}"),
        )
      ]),
    );
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
}

class myclasss extends GetxController {
  RxString sum = "".obs;

  double a = 0;
  double b = 0;

  void mysum(String text, String text2) {

    print("V1==$text===V2==$text2");

    if (text.isNotEmpty) {
      a = double.parse(text);
    }
    else {

      a =0;
    }

 if (text2.isNotEmpty) {
      b = double.parse(text2);
    }
 else{

   b =0;
 }

    double c = a + b;

    sum.value = c.toString();
  }
}
