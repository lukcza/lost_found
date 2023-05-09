import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/myButton.dart';
import '../signin_page/signInPage.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: EdgeInsets.only(top:20),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "email",
                      icon: Icon(Icons.email_outlined)
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "password",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: passwordController2,
                  decoration: const InputDecoration(
                    hintText: "repeat password",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10,),
                MyButton(
                  width: 200,
                  height: 50,
                  onPressed: () {
                    signUp();
                  },
                  text: Text('Register'),
                  icon: Icon(Icons.arrow_forward),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  width: 200,
                  height: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()
                      ),
                    );
                  },
                  text: Text('I have an account'),
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
          )
      ),
    );
  }

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
        const Center(
          child: CircularProgressIndicator(),
        ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState?.pushNamed('/home')  ;
  }
}
