import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.obx((state) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state?.length,
              itemBuilder: (context,index){
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(state![index]["userId"].toString()),
                  ),
                  title: Text(state![index]["title"].toString()),
                );
              },
            ),
          ),
        ),
          onLoading: LinearProgressIndicator(),
          onEmpty: Text("All caught up!"),
          onError: (error)=>Text("Something went wrong")

        ),

      ),
    );
  }
}
