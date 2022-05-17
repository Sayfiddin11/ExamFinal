import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/components/decoration.dart';
import '../core/components/text_style.dart';
import '../core/constants/color_consts.dart';
import '../widget/show_dialog.dart';

class LessonPage extends StatelessWidget {
  final lesson;
  const LessonPage({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(lesson['name'],
            style: AppTextStyle.textStyleBold(size: context.h * 0.04)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat_bubble,
              color: Colors.amber,
              size: context.h * 0.04,
            ),
            onPressed: () {
              ShowDialog.showDialogs(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              height: context.h * 0.175,
              width: context.w * 0.9,
              margin: EdgeInsets.symmetric(
                  horizontal: context.w * 0.053, vertical: context.w * 0.02),
              decoration: BoxDecoration(
                borderRadius: AppDecoration.borderRadius,
                color: Color(0xffF1F2F6),
              ),
              child: Row(
                children: [
                  Container(
                    height: context.h * 0.175,
                    width: context.w * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          lesson['list'][index]['url'],
                        ),
                      ),
                      color: ConsColor.blue,
                    ),
                  ),
                  SizedBox(
                    height: context.h * 0175,
                    width: context.w * 0.54,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w * 0.02,
                        vertical: context.w * 0.015,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson['list'][index]['name'],
                            style: AppTextStyle.textStyleBold(
                                size: context.h * 0.023),
                          ),
                          SizedBox(height: context.h * 0.007),
                          Text(
                            lesson['list'][index]['person'],
                            style: AppTextStyle.textStyle(
                              size: context.h * 0.017,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "2 kun oldin yuklandi",
                                style: AppTextStyle.textStyle(
                                  size: context.h * 0.017,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.play_circle_fill,
                                color: ConsColor.blue,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/video',
                  arguments: lesson['list'][index]);
            },
          );
        },
      ),
    );
  }
}
