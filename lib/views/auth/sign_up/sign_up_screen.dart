import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  //api 8sec

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: (){
              context.push('/LanguageSelection');
            },
            child: Text('Sign Up Screen')),
      ),
    );
  }
}
