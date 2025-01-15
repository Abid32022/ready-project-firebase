import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_qurbani/views/custom_widgets/custom_button.dart';
import 'package:my_qurbani/views/custom_widgets/loading_verlay.dart';
import 'package:my_qurbani/views/test/login_provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../services/shared_preference_service.dart';
import '../../utils/helper/setup_locator.dart';
import '../../utils/loading_services.dart';
import '../custom_widgets/custom_dailogue.dart';
import '../custom_widgets/custom_snackbar.dart';
import '../custom_widgets/custom_textfield.dart';

class LoginScreenTest extends StatelessWidget {
  // const LoginScreenTest({super.key});

  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<LoginProvider>();
    return Scaffold(
      body: Column(
        children: [
          /// listview.builder animated
          // AnimationLimiter(
          // child: Container(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     return AnimationConfiguration.staggeredList(
          //         position: index,
          //         duration: const Duration(milliseconds: 500),
          //         child: SlideAnimation(
          //           verticalOffset: 50.0,
          //           child: FadeInAnimation(
          //             child: Card(
          //               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //               child: ListTile(
          //                 title: Text(items[index]),
          //                 trailing: Icon(Icons.arrow_forward),
          //               ),
          //             ),
          //           ),
          //         )
          //     );
          //   }),
          // ),),
          /// listview.builder animated

          // SizedBox(height: 50,),
          // AnimationLimiter(
          //   child: Expanded(
          //     child: GridView.builder(
          //       padding: const EdgeInsets.all(10),
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 10,
          //         mainAxisSpacing: 10,
          //         mainAxisExtent: 100
          //       ),
          //       itemCount: items.length,
          //       itemBuilder: (context, index) {
          //         return AnimationConfiguration.staggeredGrid(
          //           position: index,
          //           duration: const Duration(milliseconds: 500),
          //           columnCount: 2, // Matches the crossAxisCount
          //           child: ScaleAnimation(
          //             scale: 0.5, // Starting scale
          //             child: FadeInAnimation(
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: Colors.blueAccent,
          //                   borderRadius: BorderRadius.circular(15),
          //                 ),
          //                 child: Center(
          //                   child: Text(
          //                     items[index],
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          //   // SizedBox(height: 100,),
          //   // CustomTextField(
          //   //   controller: provider.nameController,
          //   //     hintText: 'first name ',
          //   //     // focusNode: _focusNode3,
          //   //     suffixIcon: Icon(Icons.visibility),
          //   //     onEditingComplete: (){
          //   //       // FocusScope.of(context).requestFocus(_focusNode3);
          //   //     }
          //   // ),
          //   // SizedBox(height: 20,),
          //   // CustomTextField(
          //   //   controller: provider.lastController,
          //   //     hintText: 'first name ',
          //   //     // focusNode: _focusNode3,
          //   //     suffixIcon: Icon(Icons.visibility),
          //   //     onEditingComplete: (){
          //   //       // showTopSnackBar(context,'Success');
          //   //       // FocusScope.of(context).requestFocus(_focusNode3);
          //   //     }
          //   // ),

            SizedBox(height: 50,),
          ValueListenableBuilder<bool>(
            valueListenable: loadingService.getLoadingNotifier('login'),
            builder: (context, isLoading, child) {
              print('THe loading is ${isLoading}');
              return isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                text: 'Login',
                loading: false,
                onPressed: () {

                  print('The loading is No 1: ${loadingService.isLoading('login')}');
                  provider.login(context: context);
                  print('The loading is No 2: ${loadingService.isLoading('login')}');
                },
                width: 200,
              );
            },
          ),

          // ValueListenableBuilder<bool>(
      //   valueListenable: loadingService.getLoadingNotifier('login'),
      //   builder: (context, isLoading, child) {
      //     return LoadingOverlay(
      //       isLoading: isLoading,
      //       child:
      //     );
      //   },
      // ),


      // LoadingOverlay(
            //   isLoading: loadingService.isLoading('login'),
            //   child: CustomButton(text: 'Login', loading: false, onPressed: (){
            //     print('yes');
            //     provider.login(context: context);
            //     // showPlatformSnackbar(
            //     //   context: context,
            //     //   message: 'This is a success message!',
            //     //   // isSuccess: true,
            //     // );
            //   },
            //     width: 200),
            // ),
          SizedBox(height: 10,),
          // CustomButton(text: 'Login', loading: provider.loading, onPressed: (){
          //     print('yes');
          //     provider.login(context: context);
          //     // showPlatformSnackbar(
          //     //   context: context,
          //     //   message: 'This is a success message!',
          //     //   // isSuccess: true,
          //     // );
          //   },
          //     width: 200),
          //   // SizedBox(height: 20,),
          //   // CustomButton(text: 'Login', loading: false, onPressed: (){
          //   //   print('yes');
          //   //   showPlatformDialog(context);
          //   //   // provider.login(context: context);
          //   //   // showIOSSnackbar(
          //   //   //   context: context,
          //   //   //   message: 'This is a success message!',
          //   //   //   isSuccess: true,
          //   //   // );
          //   // },
          //   //   width: 200),
          // ),

        ],
      ),
    );
  }
}
