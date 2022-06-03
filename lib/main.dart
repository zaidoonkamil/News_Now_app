import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/view/home_page.dart';

main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}