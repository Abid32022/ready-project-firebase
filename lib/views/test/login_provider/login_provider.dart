import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_qurbani/data/repositories/api_service.dart';
import 'package:my_qurbani/utils/helper/custom_logger.dart';
import 'package:my_qurbani/utils/loading_mixin.dart';
import '../../../utils/loading_services.dart';
import '../../custom_widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier with LoadingMixin {

  ApiService apiService = ApiService();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  LoadingService loadingService = LoadingService();

  Future<void> login({required BuildContext context}) async {
    setLoading(loading: true);

    // print('email is ${}')

    try {
      var data = FormData.fromMap({
        'phonenumber': phoneController.text.trim(),
        'password': passwordController.text.trim(),
      });

      final response = await apiService.login(data: data);

      if (response.statusCode == 200) {
        final responseData = response.data;

        setLoading(loading: false);
        // Print the raw response for debugging
        // print("Raw API response: $responseData");

        AppLogger.debug('Api Response body is ${responseData}')
      } else {
        setLoading(loading: false);
        // print("This is status code ==========> ${response.statusCode}");
        // print("This is status code ==========> ${response.data}");
        AppLogger.warning('This is Status Code ${response.statusCode}');
      }
    } catch (error) {
      // print("Error during login: $error");
      AppLogger.error('Error During Login $error');
      setLoading(loading: false);
    } finally {
      setLoading(loading: false);
    }
  }
}
