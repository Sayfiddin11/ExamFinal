import 'package:exam/core/extension/size_extension.dart';
import 'package:exam/views/widget/_category.dart';
import 'package:exam/views/widget/_lessons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../core/base/base_view.dart';
import '../core/components/decoration.dart';
import '../core/components/text_style.dart';
import '../core/constants/color_consts.dart';
import '../core/data/data_list.dart';
import '../service/api_servise.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: const HomePage(),
      onPageBuilder: (context, widget) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return FutureBuilder(
                future: ApiServise.getNews(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Serverda nosozlik",
                        style: AppTextStyle.textStyleBold(
                          size: context.w * 0.05,
                        ),
                      ),
                    );
                  } else {
                    var data = snapshot.data;
                    return myScafold(context, data);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  Scaffold myScafold(BuildContext context, var data) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: context.w * 0.053, top: context.h * 0.045),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Qanday darslar sizni qiziqtiradi?",
                        style:
                        AppTextStyle.textStyleBold(size: context.h * 0.04),
                      ),
                      SizedBox(height: context.h * 0.005),
                      Text(
                        "28 xil yo`nalishda darsliklar mavjud",
                        style: AppTextStyle.textStyle(size: context.w * 0.04),
                      )
                    ],
                  ),
                ),
                Container(
                  height: context.h * 0.044,
                  width: context.w * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: context.w * 0.02),
                  margin: EdgeInsets.symmetric(vertical: context.h * 0.022),
                  decoration: BoxDecoration(
                    borderRadius: AppDecoration.borderRadius,
                    color: Color(0xffF1F2F6),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Izlash",
                        style: AppTextStyle.textStyle(size: context.h * 0.017),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.search,
                        color: ConsColor.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Category(contextt: context),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.w * 0.053,
                      vertical: context.h * 0.014),
                  child: Text(
                    category[context.watch<HomeCubit>().indexCount]['sub'],
                    style: AppTextStyle.textStyleNormal(
                      size: context.h * 0.027,
                    ),
                  ),
                )
              ],
            ),
          ),
          Lessons(data: data),
        ],
      ),
    );
  }
}