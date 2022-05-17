import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/material.dart';

import '../core/components/decoration.dart';
import '../core/components/text_style.dart';
import '../core/constants/color_consts.dart';

class ShowDialog{
  static showDialogs(context){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: context.h * 0.32,
          width: context.w * 0.8,
          padding: EdgeInsets.all(context.w * 0.03),
          decoration: BoxDecoration(
            borderRadius: AppDecoration.borderRadius,
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text("Foydalanish bo`yicha qo`llanma!",style: AppTextStyle.textStyleBold(size: context.h * 0.022)),
              SizedBox(height: context.h * 0.02,),
              Row(
                children: [
                  const  Icon(Icons.download_for_offline, color: Color.fromARGB(255, 108, 186, 197),),
                  Text("Videoni dasturga yuklab olish uchun!",style: AppTextStyle.textStyleNormal(size: context.h * 0.019),)
                ],
              ),
              SizedBox(height: context.h * 0.02,),
              Row(
                children: [
                  const  Icon(Icons.play_circle,color: Color.fromARGB(255, 3, 186, 210),),
                  Text("Videoni offlayn ko`rish uchun!",style: AppTextStyle.textStyleNormal(size: context.h * 0.019),)
                ],
              ),
              SizedBox(height: context.h * 0.02,),
              Row(
                children: [
                  const  Icon(Icons.play_circle,color: Colors.transparent,),
                  SizedBox(height: context.h * 0.036,width: context.w * 0.5,child: Text("Videoni onlayn ko`rish uchun esa umumiy blok ustiga bosing!",style: AppTextStyle.textStyleNormal(size: context.h * 0.019),))
                ],
              ),
              GestureDetector(
                child: Container(
                  height: context.h * 0.055,
                  width: context.w * 0.6,
                  margin: EdgeInsets.only(top: context.h * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: AppDecoration.borderRadius,
                    color: ConsColor.blue,
                  ),
                  child: Center(
                    child: Text("Tushunarli",style: AppTextStyle.textStyleNormal(color: Colors.white, size: context.h * 0.025),),
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}