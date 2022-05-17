import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../core/components/decoration.dart';
import '../../core/components/text_style.dart';
import '../../core/constants/color_consts.dart';


class Lessons extends StatelessWidget {
  final List data;
  const Lessons({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            child: Container(
              height: context.h * 0.27,
              width: context.w * 0.09,
              padding: EdgeInsets.all(context.w * 0.02),
              margin: EdgeInsets.symmetric(
                horizontal: context.h * 0.02,
                vertical: context.w * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: AppDecoration.borderRadius,
                color: const Color(0xffF1F2F6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: context.h * 0.147,
                    width: context.w * 0.94,
                    decoration: BoxDecoration(
                        borderRadius: AppDecoration.borderRadius,
                        image:  DecorationImage(
                          image: CachedNetworkImageProvider(data[index]['attributes']['img_url'][0]['url'])
                        ),
                        color: ConsColor.blue,),
                  ),
                  Text(
                    data[index]['attributes']['name'],
                    style: AppTextStyle.textStyleBold(size: context.w * 0.06),
                  ),
                  Text(
                    data[index]["attributes"]['subtitle'],
                    style: AppTextStyle.textStyle(size: context.w * 0.04),
                  ),
                  Text(
                    data[index]['attributes']['percent'],
                    style: AppTextStyle.textStyleNormal(
                      size: context.w * 0.04,
                      color: ConsColor.blue,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/lessons', arguments: data[index]['attributes']['lesson']);
            },
          );
        },
        childCount: data.length
      ),
    );
  }
}
