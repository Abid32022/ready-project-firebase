import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_qurbani/views/custom_widgets/custom_button.dart';
enum UserRoles { users , sellers}

class EnumMainClass extends StatelessWidget {
  // const EnumMainClass({super.key});

  void handleRoles (UserRoles role,BuildContext context){
    switch (role){
      case UserRoles.users:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
        break;
      case UserRoles.sellers:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Sign()));
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200,),

          CustomButton(text: 'User', loading: false, onPressed: (){
            handleRoles(UserRoles.sellers,context);
          }),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('User'),
      ),
    );
  }
}
class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Seller'),
      ),
    );
  }
}

