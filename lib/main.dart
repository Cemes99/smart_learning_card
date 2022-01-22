
import 'package:flutter/material.dart';
import 'constant.dart';
import 'global/global.dart';

import 'app/screens/history.dart';
import 'app/screens/list_topic.dart';
import 'app/screens/pre_login_screen.dart';
import 'app/screens/profile.dart';
import 'app/screens/statistics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Learning For Kid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> _listTitle = const [
    'List Topic',
    'History',
    'Statistics',
    'Profile'
  ];

  final List<Widget> _list = const [
    ListTopicScreen(),
    HistoryScreen(),
    StatisticsScreen(),
    ProfileScreen()
  ];

  int choose = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: global
        ? _list[choose]
        : (
          (choose >= 1 && choose <= 3)
          ? PreLoginScreen(title: _listTitle[choose])
          : _list[choose]
        ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: defaultAppBarLine)
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          backgroundColor: backgroundColor,
          selectedLabelStyle: const TextStyle(
            fontSize: 0
          ),
          unselectedLabelStyle: const TextStyle(
              fontSize: 0
          ),
          currentIndex: choose,
          onTap: (index) {
            setState(() {
              choose = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  color: Colors.yellow,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                ),
                label: ""
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.history_rounded,
                color: Colors.yellow,
              ),
              icon: Icon(
                Icons.history_outlined,
                color: Colors.grey,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.yellow,
                ),
                icon: Icon(
                  Icons.bar_chart_outlined,
                  color: Colors.grey,
                ),
                label: ""
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person_rounded,
                  color: Colors.yellow,
                ),
                icon: Icon(
                  Icons.person_outlined,
                  color: Colors.grey,
                ),
                label: ""
            ),
          ],
        ),
      ),
    );
  }
}
