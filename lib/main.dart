import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: 'nf_cupertino3_9_september',
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  const TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {
  int pilihIndex = 0;

  @override
  void initState() {
    pilihIndex = 0;
    super.initState();
  }

  List<Widget> dataBody = [
    const Text(
      'Home',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Search',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Archive',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Profile',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {}),
          backgroundColor: Colors.blue,
          middle: const Text(
            'Appbar Cupertino',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: const Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: const Icon(
                      CupertinoIcons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {})
              ]),
        ),
        child: Center(
            child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                    onTap: (nilai) {
                      pilihIndex = nilai;
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.search), label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.archivebox),
                          label: 'archive'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.profile_circled),
                          label: 'Profile')
                    ]),
                tabBuilder: (context, index) {
                  return CupertinoTabView(
                    builder: (context) {
                      return Center(child: dataBody[pilihIndex]);
                    },
                  );
                })));
  }
}
