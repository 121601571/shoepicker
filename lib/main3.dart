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
  final InfiniteScrollController _infiniteController2 =
      InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  final InfiniteScrollController _infiniteController3 =
      InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 9; i++) {
      ll.add((i + 1).toString());
      ll2.add((i + 1).toString());
      ll3.add((i + 1).toString());
    }
  }

  var ll = new List();
  var ll2 = new List();
  var ll3 = new List();

  double curoffset = 0.0;
  double curoffset2 = 0.0;
  double curoffset3 = 0.0;

  Widget mybody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Today my luck draw is ...',
              style: TextStyle(fontSize: 30, color: Colors.purple),
            ),
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
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              child: _buildTab2(0),
              height: 90,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              child: _buildTab3(0),
              height: 90,
              width: MediaQuery.of(context).size.width * 0.3,
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
    var nn = Random();
    var ok1 = 1;
    curoffset = 100.0 * ok1;
    ok1 = 1;
    curoffset2 = 100.0 * ok1*4;
    ok1 = 1;
    curoffset3 = 100.0 * ok1*6;
    _infiniteController.animateTo(curoffset,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastOutSlowIn);
    _infiniteController2.animateTo(curoffset2,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.fastOutSlowIn);
    _infiniteController3.animateTo(curoffset3,
        duration: const Duration(milliseconds: 4000),
        curve: Curves.fastOutSlowIn);
    print(curoffset);
    print(curoffset2);
    print(curoffset3);


    //_start1();
  }

  String getT(idx, aa) {
    if (idx < 0) {
      idx = 0 - idx;
    }
    var newidx = idx % ll.length;
    if (aa == 0) {
      return ll[newidx];
    }
    if (aa == 1) {
      return ll2[newidx];
    }
    if (aa == 2) {
      return ll3[newidx];
    }
    return '';
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 90,
          child: Text(
            getT(index, 0),
            style: TextStyle(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1.0),
      anchor: 0.5,
    );
  }

  Widget _buildTab2(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController2,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
                title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 89,
              child: Text(
                getT(index, 1),
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

  Widget _buildTab3(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController3,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
                title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 89,
              child: Text(
                getT(index, 2),
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
