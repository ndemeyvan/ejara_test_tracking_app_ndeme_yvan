import 'package:flutter/material.dart';

class UndefinedPage extends StatefulWidget {
  const UndefinedPage({Key? key}) : super(key: key);

  @override
  State<UndefinedPage> createState() => _UndefinedPageState();
}

class _UndefinedPageState extends State<UndefinedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello , i don't know what you want to do , but you are lost bro , "),
      ),
    );
  }
}
