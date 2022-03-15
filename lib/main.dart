import 'package:flutter/material.dart';
import 'dart:io';
import 'Screens/detail_Page.dart';
import 'Screens/main_Page.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Project',
       theme: ThemeData(
         appBarTheme: AppBarTheme(
           brightness: Brightness.light,
           color: Colors.transparent,
           shadowColor: Colors.transparent,
         ),
       ),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/':( context) => MainPage(),
        '/detail':(context) => DetailPage("","","","","","",""),
      },
    );
  }
}




