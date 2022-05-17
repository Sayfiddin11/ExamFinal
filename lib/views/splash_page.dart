import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/api_servise.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    ApiServise.getNews();
    Future.delayed(const Duration(seconds: 5)).then((value){
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050352),
      body: Column(
        children: [
          SizedBox(
            width: context.w,
            height: context.h * 0.37,
          ),
          SizedBox(
            height: context.h * 0.2,
            child: Image.asset("assets/image/Group 734.png"),
          ),
          SizedBox(height: context.h * 0.30,),
          SizedBox(
            width: context.w * 0.5,
            child: Image.asset("assets/image/Group 733.png"),
          ),
        ],
      ),
    );
  }
}
