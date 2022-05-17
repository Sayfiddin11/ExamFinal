import 'package:flutter/material.dart';
import '../views/error_page.dart';
import '../views/home_page.dart';
import '../views/lessons_page.dart';
import '../views/splash_page.dart';
import '../views/video_page.dart';

class Routes {
  Route? ongenerateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (context) => SplashPage());
      case "/home":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/lessons":
        return MaterialPageRoute(builder: (context) => LessonPage(lesson: args,));
      case "/video":
        return MaterialPageRoute(builder: (context) => VideoPage(data: args,));
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}