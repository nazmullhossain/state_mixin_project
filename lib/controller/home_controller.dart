import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>>{
  @override
  void onInit() {
    // TODO: implement onInit
    fetchComments();
    super.onInit();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }




  fetchComments() async {
    await Future.delayed(5.seconds);
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // print(response.body);



    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);

      // var comments = List<String>.from(js.map((e) => e));
      var comments=List<dynamic>.from(js.map((x)=>x));
      print("comment ${comments}");

      if (comments.isEmpty)
        //! NO RECORDS
        change(null, status: RxStatus.empty());
      else
        //SUCCESS
        change(comments , status: RxStatus.success());
    } else {
      //! ERROR
      change(null, status: RxStatus.error('something went wrong: ${response.statusCode}'));
    }
  }
}
//dynamiclist [{text: foo, value: 1, status: true}, {text: bar, value: 2, status: false}]
// ({text: bar, value: 2, status: false})

//final  fooData =List.from(dynamicList.where((x) => x['text'] == 'foo'));