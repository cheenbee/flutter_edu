import 'package:flutter/material.dart';
import 'package:hsfx/pages/course_page.dart';
import 'package:hsfx/pages/home.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScaffoldIndex(),
    );
  }
}

class ScaffoldIndex extends StatefulWidget {
  @override
  _ScaffoldIndexState createState() => _ScaffoldIndexState();
}

class _ScaffoldIndexState extends State<ScaffoldIndex> {
  int _selectedIndex = 0;
  final bottomBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('课程')),
    BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('考试')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 13,
        selectedFontSize: 14,
        showUnselectedLabels: true,
      ),

      body: IndexedStack(
      index: _selectedIndex,
      children: <Widget>[
        HomePage(),
        CoursePage(),
        HomePage(),
        CoursePage(),
      ],

    ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
