// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), theme: baseTheme);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Home"),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}

class MyAppBar extends AppBar {
  BuildContext context;
  String currentPage;
  MyAppBar(this.context, this.currentPage)
      : super(
            title: Text("Angelika Ostrowska", style: TextStyle(fontSize: 28)),
            actions: Menu(
                    context,
                    currentPage,
                    TextStyle(fontSize: 28)).menuItems,
                    // , decoration: TextDecoration.underline
            toolbarHeight: 70);
}

class Menu {
  BuildContext context;
  String currentPage;
  TextStyle menuTextStyle;
  List<Widget> menuItems = [];

  Menu(this.context, this.currentPage, this.menuTextStyle) {
    this.createMenuItems();
  }

  void createMenuItems() {
    this.menuItems = <Widget>[
      MenuItem("Home", "Home" == currentPage, () => HomePage(), menuTextStyle),
      SizedBox(width: 10),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text("Projects", style: menuTextStyle)),
      SizedBox(width: 10),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text("Contact", style: menuTextStyle)),
      SizedBox(width: 10),
    ];
  }
}

class MenuItem extends StatefulWidget {
  String text;
  bool isActive;
  Function pageOpener;
  TextStyle menuTextStyle;
  MenuItem(this.text, this.isActive, this.pageOpener, this.menuTextStyle,
      {super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.pageOpener()));
        },
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 0.5, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: widget.isActive ? Colors.black : Colors.white,
            width: 2.0, // Underline thickness
          ))),
          child: Text(
            widget.text,
            style: widget.menuTextStyle,
          ),
        ));
  }
}