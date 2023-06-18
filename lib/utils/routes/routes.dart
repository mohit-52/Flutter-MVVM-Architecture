import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen());

      case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());

      case RoutesName.signup :
        return MaterialPageRoute(builder: (BuildContext context)=> const SignupScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}