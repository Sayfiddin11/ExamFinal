import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/material.dart';

import '../core/components/text_style.dart';
import '../core/constants/color_consts.dart';

class VideoPage extends StatelessWidget {
  final data;
  const VideoPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.h * 0.3,
            color: ConsColor.blue,
            child: Image.network(data['url'],fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.w * 0.053,
              vertical: context.h * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  style: AppTextStyle.textStyleBold(size: context.h * 0.026),
                ),
                SizedBox(height: context.h * 0.01),
                Text(
                  data['text'],
                  style: AppTextStyle.textStyle(size: context.h * 0.02),
                ),
                SizedBox(height: context.h * 0.02),
                Text(
                  data['text_long'],
                  style: AppTextStyle.textStyle(size: context.h * 0.02),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
