import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/views/signIn_page/signUpPage.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
