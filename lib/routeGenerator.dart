import 'package:flutter/material.dart';
import 'package:lost_found/main.dart';
import 'package:lost_found/views/home_page/homePage.dart';
import 'package:lost_found/views/lost_item_add_page/lostItemAddPage.dart';
import 'package:lost_found/views/lost_item_page/lostItemPage.dart';
import 'package:lost_found/views/profile_page/profilePage.dart';
import 'package:lost_found/views/signin_page/signInPage.dart';
import 'package:lost_found/views/signup_page/signUpPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/lostItemAdd':
        return MaterialPageRoute(builder: (_) => LostItemAddPage());
      case '/lostItem':
        return MaterialPageRoute(builder: (_) => LostItemPage());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(child: Text("Route ERORR"),),
      );
    });
  }
}
