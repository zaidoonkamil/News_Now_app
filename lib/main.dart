import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/view/home_page.dart';
import 'package:news_app/view/splash_screen.dart';

main (){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
/
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        centered: true,
        splashIconSize: 900,
        nextScreen: const HomeView(),
      )
    );
  }
}