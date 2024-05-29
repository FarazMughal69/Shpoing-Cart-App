import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/home/ui/home.dart';

late Size mq;
const Color appBarTxtClr = Color.fromRGBO(233, 233, 229, 1);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
            // color: appBarTxtClr,
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 3,
          backgroundColor: Colors.teal,
          shadowColor: Color.fromARGB(255, 29, 28, 28),
          iconTheme: IconThemeData(color: appBarTxtClr),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: appBarTxtClr,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
