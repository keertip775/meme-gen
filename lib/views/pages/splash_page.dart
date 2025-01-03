import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_gen/views/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String routeName = '';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Get.off(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/meme.png",
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
