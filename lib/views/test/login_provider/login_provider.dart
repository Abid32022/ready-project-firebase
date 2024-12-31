import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_qurbani/data/repositories/api_service.dart';
import 'package:my_qurbani/utils/loading_mixin.dart';
import '../../custom_widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier with LoadingMixin{

  ApiService apiService = ApiService();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();


  //show cupertino dialogue and center loading
  Future<void> login({required BuildContext context}) async {
    setLoading(loading: true);
    showCupertinoDialog(context: context, builder: (context){
      return Center(
        child: loading? CircularProgressIndicator():SizedBox(),
      );
    });
    try {
      var data = FormData.fromMap({
        'phonenumber': nameController.text.trim(),
        'password': lastController.text.trim(),
      });

      final response = await apiService.login(param: data);
      if (response.statusCode == 200) {

        final responseData = response.data;
        print("Raw API response: $responseData");
        String message = responseData['status'];
        // showCustomSnackBar(context: context,message: message,isSuccess: true);
      } else {
        setLoading(loading: false);
        Navigator.pop(context);

        print("This is status code ==========> ${response.statusCode}");
      }
    } catch (error) {
      Navigator.pop(context);

      print("Error during login: $error");
      setLoading(loading: false);
    } finally {
      setLoading(loading: false);
    }
  }


}