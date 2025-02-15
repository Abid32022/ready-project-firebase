import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../../../data/repositories/api_service.dart';
import '../dating_model/dating_model.dart';

class DatingProvider extends ChangeNotifier {
  DatingModel? datingModel;
  List<Results> _allResults = [];
  bool isLoading = false;
  bool hasMoreData = true;
  int currentPage = 1;
  ApiService apiService = ApiService();

  Future<void> getDatingList({bool isNextPage = false}) async {
    if (isLoading) return;
    if (!hasMoreData && isNextPage) return;

    isLoading = true;
    notifyListeners();

    try {
      final response = await apiService.getDatingRepo(page: currentPage, result: 10);

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data)
            : response.data;

        DatingModel newModel = DatingModel.fromJson(responseData);

        // Update state
        if (isNextPage) {
          _allResults.addAll(newModel.results ?? []);
        } else {
          _allResults = newModel.results ?? [];
        }
        datingModel = newModel.copyWith(results: _allResults);
        hasMoreData = (newModel.results?.isNotEmpty ?? false);
        if (hasMoreData) {
          currentPage++;
        }
      } else {
        hasMoreData = false;
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
