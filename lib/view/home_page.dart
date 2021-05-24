import 'package:flutter/material.dart';
import 'package:flutter_testes_unitarios/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final IHomeController controller;

  const HomePage({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IHomeController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = widget.controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.currentIndex
        .then((currentIndex) => _currentIndex = currentIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text('Website Update'),
        actions: [
          IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
          IconButton(icon: Icon(Icons.ac_unit_sharp), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) async => await _controller
            .setCurrentIndex(newIndex)
            .then((value) => setState(() {})),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sanitizer), label: "Item 1"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Item 2"),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            ListView(
              key: const Key('list-view-copy'),
              shrinkWrap: true,
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: (newValue) {},
                  title: Text('Survey user'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
