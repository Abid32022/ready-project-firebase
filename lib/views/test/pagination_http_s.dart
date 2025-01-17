import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationHttpScreen extends StatefulWidget {
  const PaginationHttpScreen({super.key});

  @override
  State<PaginationHttpScreen> createState() => _PaginationHttpScreenState();
}

class _PaginationHttpScreenState extends State<PaginationHttpScreen> {

  List itemList = [];
  int page = 1;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        ++page;
        fetchData();
      }
    });
    fetchData();
  }

  void fetchData()async{
    int limit = 25;
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page");
    final result = await http.get(url);
    if(result.statusCode == 200){
      final List data = jsonDecode(result.body);
      if(data.length < limit){
        hasMoreData = false;
      }
      setState(() {
        itemList.addAll(data.map((e) => "items${e["id"]}"));
      });
    }else {
      print("error ${result.statusCode}");
    }
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: itemList.isNotEmpty ? ListView.builder(
            controller: scrollController,
            itemCount: itemList.length+1,
            itemBuilder: (context, index){
              if(index < itemList.length){
                return ListTile(
                  leading: FlutterLogo(),
                  title: Text(itemList[index].toString()),
                );
              } else {
                return hasMoreData ? Center(child: CircularProgressIndicator()) : Center(child: Text("No More Data"),);
              }
            }
        ):
        Center(child: CircularProgressIndicator())
    );
  }
}

