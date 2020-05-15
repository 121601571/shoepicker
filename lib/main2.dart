import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      ll.add(randomString(10));
    }
  }

  var ll = new List();
  double curoffset = 0.0;

  Widget mybody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Today my shoes is ...', style: TextStyle(fontSize: 30, color: Colors.purple),),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: _buildTab(0),
              height: 90,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        RaisedButton(
          child: Text(
            'pick',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: _start1,
          color: Colors.blue,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),

      body: mybody(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _start1,
//        child: Icon(Icons.threesixty),
//
//      ),
    );
  }

  void _start1() async {
    curoffset += 90 * 60;
    var ok = await _infiniteController.animateTo(curoffset,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastOutSlowIn);
    //_start1();
  }

  String getT(idx){
    if (idx <0){
      idx = 0 - idx;
    }
    var newidx = idx % ll.length;
    return ll[newidx];
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
                title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 89,
              child: Text(
                getT(index),
                style: TextStyle(
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            )
                //subtitle: Text('Subtitle $index'),
                //trailing: const Icon(Icons.chevron_right),
                ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1.0),
      anchor: 0.5,
    );
  }
}
