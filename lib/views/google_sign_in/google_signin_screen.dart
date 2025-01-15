import 'package:flutter/material.dart';
import 'package:my_qurbani/views/auth/login_screen/login_screen.dart';
import 'package:my_qurbani/views/dashboard/categories_screen.dart';

import 'auth_services.dart';

class GoogleSigninScreen extends StatelessWidget {
  // const GoogleSigninScreen({super.key});
  AuthMethods authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),

          MaterialButton(
              color: Colors.blue,
              child: Text('Google',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
              onPressed: ()async{
                bool isSignedIn = await authMethods.signInWithGoogle(context);
                if (isSignedIn) {
                  authMethods.signInWithGoogle(context);
                  print('Done its ${isSignedIn}');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      CategoryScreen()));
                }
              }),

          SizedBox(height: 40,),
      	MaterialButton(
        color: Colors.blue,
        child: Text('SignOut',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
        onPressed: ()async{
          bool isSignedIn = await authMethods.signInWithGoogle(context);
          if (isSignedIn) {
            authMethods.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

          }}),


        ],
      ),
    );
  }
}
