
import 'package:dio/dio.dart';
import '../../config/app_urls.dart';
import '../../services/api_client.dart';

class ApiService {
  final APIClient apiClient = APIClient();

  //auth
  Future<Response> signup({var param}) {
    return apiClient.post(url: AppUrls.signUp, params: param);
  }

  Future<Response> login({var data}) {
    return apiClient.post(url: AppUrls.baseUrl+ AppUrls.login,params: data);
  }
  Future<Response> getImage() {
    return apiClient.get(url: AppUrls.baseUrl);
  }

  Future<Response> logout() {
    return apiClient.post(url: AppUrls.logout);
  }

  // Future<Response> forgetPassword({var param}) {
  //   return apiClient.post(url: AppUrl.forgetPassword, params: param);
  // }

  // Future<Response> enableDisableDataBackup({required bool isBackupEnabled}) {
  //   return apiClient.post(url: isBackupEnabled == true ? AppUrl.enableBackup : AppUrl.disableBackup);
  // }

  // Future<Response> exportData() {
  //   return apiClient.get(url: AppUrl.exportData);
  // }
  //
  // Future<Response> importData({var param}) {
  //   return apiClient.post(url: AppUrl.importData, params: param);
  // }
  //
  // Future<Response> createVault({var param}) {
  //   return apiClient.post(url: AppUrl.createVaults, params: param);
  // }
  //
  // Future<Response> getAllVault({required int index}) {
  //   String url = AppUrl.getAllVaults;
  //   if (index == 0) {
  //     url = AppUrl.getAllVaults;
  //   }
  //   else if(index == 1) {
  //     url = AppUrl.recentVaults;
  //   }
  //   else if (index == 2){
  //     url = AppUrl.getFavourite;
  //   }
  //   else if(index == 3){
  //     url = AppUrl.getLastEdited;
  //   }
  //
  //   return apiClient.get(url: url);
  // }
  //
  // Future<Response> recentVaults() {
  //   return apiClient.get(url: AppUrl.recentVaults);
  // }
  //
  // Future<Response> getProfile() {
  //   return apiClient.get(url: AppUrl.getProfile);
  // }
//
//   Future<Response> editProfile({required var param}) {
//     return apiClient.post(url: AppUrl.editProfile, params: param);
//   }
//
//   Future<Response> deleteVault({required int id}) {
//     return apiClient.delete(url: '${AppUrl.deleteVault}$id');
//   }
//
//   Future<Response> toggleFavoriteVault({required int id}) {
//     return apiClient.post(url: '${AppUrl.favVault}$id${AppUrl.favVault2}');
//   }
//
//   Future<Response> getVaultDetails({required int id}) {
//     return apiClient.get(url: '${AppUrl.vaultDetails}${id}');
//   }
//
//   Future<Response> addCard({required var param}) {
//     return apiClient.post(url: AppUrl.addCard, params: param);
//   }
//
//   Future<Response> createPayment() {
//     return apiClient.post(url: AppUrl.createPayment);
//   }
//
//   Future<Response> generatePassword({required var param}) {
//     return apiClient.post(url: AppUrl.generatePassword, params: param);
//   }
//
//   ////////////////////////////////// By Iqra///////////////////////////////
// Future<Response> postCategories({var param}){
//     return apiClient.post(url: AppUrl.postcategories,params: param);
// }
//
//   Future<Response> enableDisable2FA({required bool isEnabled}){
//     return apiClient.post(url: isEnabled == true ? AppUrl.enable2FA : AppUrl.disable2FA);
//   }
//
//   Future<Response> enableDisableBiometric({required bool isEnabledBio}){
//     return apiClient.post(url: isEnabledBio == true ? AppUrl.enablebiometric
//         : AppUrl.disablebiometric);
//   }
//
//   Future<Response> subscriptionsPlan(){
//     return apiClient.get(url: AppUrl.subscriptionplan);
//   }
//
//   Future<Response> toggleSecurity({required var param})
//   {
//     return apiClient.post(url: AppUrl.togglesecurity,params:param);
//   }
//
//   Future<Response> toggleRegularUpdates({required var param}){
//     return apiClient.post(url: AppUrl.toggleregularupdates,params: param);
//   }
//
//   Future<Response> togglePromotionalNotification({required var param}){
//     return apiClient.post(url: AppUrl.togglepromotionnot,params: param);
//   }
//
//   Future<Response> forgetPassword({var param}){
//     return apiClient.post(url: AppUrl.forgetPassword,params: param);
//   }
//
//   Future<Response> otpVerification({var param}){
//     return apiClient.post(url: AppUrl.verifyotp,params: param);
//   }
//
//   Future<Response>resetPassword({required var param}){
//     return apiClient.post(url: AppUrl.resetPassword,params: param);
//   }
//
//   Future<Response>deleteAccount()
//   {
//     return apiClient.delete(url: AppUrl.deleteAccount);
//
//   }
//
//   Future<Response>deleteData()
//   {
//     return apiClient.delete(url: AppUrl.deleteData);
//   }

}
