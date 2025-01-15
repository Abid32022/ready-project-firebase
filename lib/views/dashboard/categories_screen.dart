import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_qurbani/config/app_constant.dart';
import 'package:my_qurbani/config/app_validators.dart';
import 'package:my_qurbani/views/custom_widgets/cached_network_image.dart';
import 'package:my_qurbani/views/custom_widgets/custom_shimmer.dart';
import 'package:my_qurbani/views/dashboard/category_provider.dart';
import 'package:provider/provider.dart';
// import 'package:skeletonizer/skeletonizer.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_screen_indicator.dart';
import '../custom_widgets/custom_textfield.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  String? _imagePath;
  String? _imagePath2;

  void _updateImagePath(String? path) {
    setState(() {
      _imagePath = path;
    });
  }
  void _updateImagePath2(String? path) {
    setState(() {
      _imagePath2 = path;
    });
  }

  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CategoryProvider>().getAllCategories();
    });
  }
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CategoryProvider>();
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70 ,
                ),
                ///image picker
                if (_imagePath != null)
                  Image.file(
                    File(_imagePath!),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                else
                  Text('No image selected'),
                SizedBox(height: 40.h,),
                ElevatedButton(
                  onPressed: () {
                   AppConstants.getImage(_updateImagePath);
                  },
                  child: Text('Pick Image'),
                ),

                if (_imagePath2 != null)
                  Image.file(
                    File(_imagePath2!),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                else
                  Text('No image selected'),
                SizedBox(height: 40.h,),
                ElevatedButton(
                  onPressed: () {
                    AppConstants.getImage(_updateImagePath2 );
                    // print(_imagePath2);
                    // String filepath = _imagePath2!.toString().trim();
                    // String fileName = filepath.split('/').last;
                    //
                    // print(filepath);
                  },
                  child: Text('Pick Image'),
                ),
                ///validations // focus node
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                hintText: 'first name ',
                  focusNode: _focusNode,
                  validator: (value){
                 return AppValidator.nameValidator(value);
                  },
                  onEditingComplete: (){
                    FocusScope.of(context).requestFocus(_focusNode2);
                  }
                ),
                SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'first name ',
                    focusNode: _focusNode2,
                    onEditingComplete: (){
                      FocusScope.of(context).requestFocus(_focusNode3);
                    },
                  validator: (value){
                  return  AppValidator.emailValidation(value);
                  },
                ),
                // CustomScreenIndicator(),
                SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'first name ',
                  focusNode: _focusNode3,
                    suffixIcon: Icon(Icons.visibility),
                    onEditingComplete: (){
                      FocusScope.of(context).requestFocus(_focusNode3);
                    }
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Form is valid");
                    } else {
                      print("Form is invalid");
                    }
                  },
                  child: Text("Submit"),
                ),

                CircleAvat(Radius: 30,),
                SizedBox(height: 20,),
                SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
                SpinKitFadingCube(
                  color: Colors.red,
                  size: 50.0,
                ),

                ///spinkit indicator designs
                // SpinKitDoubleBounce(
                //   color: Colors.red,
                //   size: 50.0,
                // ),
                // SpinKitChasingDots(
                //   color: Colors.orange,
                //   size: 100.0,
                // ),
                // SpinKitRipple(
                //   color: Colors.cyan,
                //   size: 100.0,
                // ),
                // SpinKitWave(
                //   color: Colors.pink,
                //   size: 20.0,
                // ),
                ///spinkit indicator designs

                CustomButton(text: 'Login',loading:false ,onPressed: (){},),
                // SpinKitCircle(
                //   color: Colors.blue,  // Spinner color
                //   size: 50.0,          // Spinner size
                // ),
                ///long text short text and square indicators
                // SizedBox(height: 20,),
                // TextLongShimmer(),
                // SizedBox(height: 20,),
                // TextShortShimmer(),
                // SizedBox(height: 20,),
                // ShimmerPlaceholder(height: 200, width: 200),
                ///long text short text and square indicators

                ///animated gridview.builder
                // Expanded(
                //   child: GridView.builder(
                //     itemCount: 4,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         childAspectRatio: (60 / 70),
                //         mainAxisSpacing: 10,
                //         crossAxisSpacing: 10,
                //         crossAxisCount: 2,
                //         mainAxisExtent: 250,
                //     ),
                //     itemBuilder: (BuildContext context, int index) {
                //       return
                //         provider.loading
                //           ? Center(
                //         child: CircularProgressIndicator(
                //           strokeCap: StrokeCap.round,
                //         )
                //         // ShimmerPlaceholder(width:300 ,height:300 ,borderRadius: BorderRadius.circular(10),),
                //       )
                //           :
                //       Center(
                //         child:
                //         CachedNetworkImageWidget(
                //           placeholderImage: 'assets/images/placeholder.jpeg',
                //           imageURL: 'https://myqurbaniapp.pk/public/uploads/images/${provider.allCategoryModel!.catogoryData![index].image}',),
                //       );
                //     },
                //   ),
                // ),
                ///animated gridview.builder

              ],
            ),
          ),
        ),
      ),
    );
  }
}

//     Container(
//     child: Consumer<CategoryProvider>(
//     builder: (context, value, child) {
//       return value.loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Center(
//               child: value.allCategoryModel!.catogoryData![0].image == null
//                   ? Image.asset('assets/Images/placeholder.jpeg')
//                   : Image.network(AppUrls.categoryImageUrl +
//                       value.allCategoryModel!.catogoryData![0].image!),
//             );
//     },
//   ),
// ));