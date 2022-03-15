
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app_neethu/model/employee.dart';

class DetailPage extends StatefulWidget {
  String name;
  //Address address;
  String phone;
  String username;
  String email;
  String profile_image;
  String id;
  String website;
  // Company company;

  DetailPage(this.name, this.id, this.username, this.email, this.profile_image,
      this.phone, this.website);

  // const DetailPage({Key? key, required this.person}) : super(key: key);
  // final Employee person;

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // toolbarHeight: 10,
      ),
      body: Column(
        children: [
      Center(
          child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey),
              ))),
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(widget.phone),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Expanded(
                  child: Text(
                widget.email,
                style: TextStyle(fontSize: 16, height: 1.4),
              )),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Website',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Expanded(
                  child: Text(
                widget.website,
                style: TextStyle(fontSize: 16, height: 1.4),
              )),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Phone',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Expanded(
                  child: Text(
                widget.id,
                style: TextStyle(fontSize: 16, height: 1.4),
              )),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'User_id',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Expanded(
                  child: Text(
                widget.username,
                style: TextStyle(fontSize: 16, height: 1.4),
              )),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
