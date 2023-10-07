import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/route_generator.dart';
import 'package:lost_found/views/auth/register/sign_up_page.dart';
import 'package:lost_found/views/home/home_page.dart';
import 'package:lost_found/views/item_add/pages/image_picker_page.dart';
import 'package:lost_found/views/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/item_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => ImagePickedData(), child: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
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
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something goes wrong'),
              );
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const SignUpPage();
            }
          },
        ),
      ),
    );
  }
}
