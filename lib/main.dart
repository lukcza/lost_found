import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/routeGenerator.dart';
import 'package:lost_found/views/home_page/homePage.dart';
import 'package:lost_found/views/lost_item_add_page/lostItemAddPage.dart';
import 'package:lost_found/views/lost_item_page/lostItemPage.dart';
import 'package:lost_found/views/profile_page/profilePage.dart';
import 'package:lost_found/views/signin_page/signInPage.dart';
import 'package:lost_found/views/signup_page/signUpPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute:RouteGenerator.generateRoute,
      /*routes: {
        '': (_) => MyApp(),
        'home': (_) => HomePage(),
        'login': (_) => SignInPage(),
        'register': (_) => SignUpPage(),
        'profile': (_) => ProfilePage(),
        'lostItem': (_) => LostItemPage(),
        'lostItemAdd': (_) => LostItemAddPage(),
      },*/
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream:  FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return  const Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return const Center(child: Text('Something goes wrong'),);
            } else if(snapshot.hasData){
              return const HomePage();
            }else {
              return const SignUpPage();
            }
          },
        ),
      ),
    );
  }
}
