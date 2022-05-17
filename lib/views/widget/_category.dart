
import 'package:exam/core/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/home_cubit.dart';
import '../../core/components/decoration.dart';
import '../../core/components/text_style.dart';
import '../../core/constants/color_consts.dart';
import '../../core/data/data_list.dart';

class Category extends StatelessWidget {
  final BuildContext contextt;
  const Category({Key? key, required this.contextt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.14,
      width: context.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: context.w * 0.053),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    height: context.h * 0.09,
                    width: context.h * 0.09,
                    padding: EdgeInsets.all(context.w * 0.035),
                    decoration: BoxDecoration(
                      borderRadius: AppDecoration.borderRadius,
                      color: index != contextt.watch<HomeCubit>().indexCount
                          ? const Color(0xffF1F2F6)
                          : ConsColor.blue,
                    ),
                    child: SvgPicture.asset(
                      category[index]['img'],
                      color: index != contextt.watch<HomeCubit>().indexCount
                          ? ConsColor.black
                          : Colors.white,
                    ),
                  ),
                  onTap: () {
                    contextt.read<HomeCubit>().addCount(index);
                  },
                ),
                SizedBox(height: context.h * 0.015),
                Text(
                  category[index]['name'],
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleNormal(size: context.h * 0.019),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
