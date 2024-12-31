import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'category_model.dart';

class CategoryProvider with ChangeNotifier {

  bool _loading = false;
  bool get loading =>_loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  CategoryModel? _allCategoryModel;
  CategoryModel? get allCategoryModel=>_allCategoryModel;

  Future<void> getAllCategories() async {
    setLoading(true);
    final url = 'https://myqurbaniapp.pk/api/get_all_categories';
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer 1158|lpPBe00HCihlaFe7iM6h0FJCH4NNl3g5AHF77zMxdac06a05",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);
        print(response.body);
        _allCategoryModel= CategoryModel.fromJson(jsonDecode(response.body));
        print(_allCategoryModel!.catogoryData![0].name);
        print(_allCategoryModel!.catogoryData!.length);

        notifyListeners();
      } else {
        setLoading(false);
        throw Exception('Failed to fetch posts${response.statusCode}');
      }

    } catch (error) {
      setLoading(false);
      notifyListeners();
      print("$error");
    }
  }

  Future<void> refreshData(BuildContext context) async {
    getAllCategories();
    notifyListeners();
  }

}