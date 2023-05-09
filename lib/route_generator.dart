import 'package:flutter/material.dart';
import 'package:lost_found/main.dart';
import 'package:lost_found/views/auth/login/sign_in_page.dart';
import 'package:lost_found/views/home/home_page.dart';
import 'package:lost_found/views/profile_page/profile_page.dart';
import 'views/auth/register/sign_up_page.dart';
import 'views/item_add/Item_add_page.dart';
import 'views/item_page/lost_item_page.dart';

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
