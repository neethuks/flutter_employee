import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_app_neethu/Screens/detail_Page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter_test_app_neethu/model/employee.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Employee> empList = [];
  bool _isloading = true;
  List<Employee> orginalList = [];
  List<Employee> searchResult = [];
  TextEditingController controller = new TextEditingController();

  //Future<List<Employee>> _getEmployee() async{
  Future _getEmployee() async {
    var response = await http
        .get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));

    List<dynamic> parsedListJson = json.decode(response.body);
    List<Employee> emp =
        List<Employee>.from(parsedListJson.map((i) => Employee.fromJson(i)));
    empList = emp;
    orginalList = emp;
    searchResult = emp;
    setState(() {
      _isloading = false;
    });
    return emp;
  }

  @override
  void initState() {
    _getEmployee();
    super.initState();
  }

  onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    orginalList.forEach((userDetail) {
      if (userDetail.name.contains(text)) searchResult.add(userDetail);
    });
    print(searchResult);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isloading
          ? AppBar()
          : AppBar(
              //AppBar(
              elevation: 0,
              backgroundColor: Colors.grey,
              title: Container(
                height: 38,
                child: TextField(
                  controller: controller,
                  onChanged: (value) => onSearchTextChanged(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search users"),
                ),
              ),
            ),
      body: Container(
        child: FutureBuilder(
            future: _getEmployee(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return searchResult.length != 0
                    ? ListView.builder(
                        itemCount: searchResult.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            searchResult[index].name,
                                            searchResult[index].phone,
                                            searchResult[index].id.toString(),
                                            searchResult[index].email,
                                            searchResult[index].username,
                                            searchResult[index].profile_image,
                                            searchResult[index].website)),
                                  ),
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      searchResult[index].profile_image),
                                ),
                                title: Text(searchResult[index].name),
                                subtitle: Text(searchResult[index].email),
                              ),
                            ],
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: empList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            empList[index].name,
                                            empList[index].phone,
                                            empList[index].id.toString(),
                                            empList[index].email,
                                            empList[index].username,
                                            empList[index].profile_image,
                                            empList[index].website)),
                                  ),
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      empList[index].profile_image),
                                ),
                                title: Text(empList[index].name),
                                subtitle: Text(empList[index].email),
                              ),
                            ],
                          );
                        },
                      );
              }
            }),
      ),
    );
  }
}
