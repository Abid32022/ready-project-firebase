import 'package:flutter/material.dart';

class FilterSearchTextfield extends StatefulWidget {
  const FilterSearchTextfield({super.key});

  @override
  State<FilterSearchTextfield> createState() => _FilterSearchTextfieldState();
}

class _FilterSearchTextfieldState extends State<FilterSearchTextfield> {

  List<Map<String , dynamic>> _allUsers = [
    {"id" : 1, "Name" : "Ali",  "age" : 20},
    {"id" : 2, "Name" : "Abid",  "age" : 22},
    {"id" : 3, "Name" : "Sumaira",  "age" : 23},
    {"id" : 4, "Name" : "Wahaj",  "age" : 24},
    {"id" : 5, "Name" : "Suzai",  "age" : 25},
    {"id" : 6, "Name" : "Tuba",  "age" : 26},
  ];

  List<Map<String , dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enterKeyword){
    List<Map<String, dynamic>> results = [];
    if(enterKeyword.isEmpty){
      results = _allUsers;
    } else {
      results = _allUsers.where((user) => user['Name'].toLowerCase().contains(enterKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged:  (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search)
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index){
                    return Card(
                      key: ValueKey(_foundUsers[index]["id"]),
                      color: Colors.blue,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Text(
                          _foundUsers[index]["id"].toString(),
                          style: TextStyle(color: Colors.white,fontSize: 24),
                        ),
                        title: Text( _foundUsers[index]["Name"].toString(),
                          style: TextStyle(color: Colors.white,fontSize: 24),),
                        subtitle: Text( _foundUsers[index]["age"].toString(),
                          style: TextStyle(color: Colors.white,fontSize: 24),),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

