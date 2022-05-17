
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/api_servise.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int indexCount = 0;
  List apis = [
    "dasturlashes",
    "dizayns",
    "smms",
    "tils"
  ];
  void addCount(index){
    indexCount = index;
    ApiServise.catgory = apis[index];
    emit(CotegoryState());
  }
}