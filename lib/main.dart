import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final images = [
    'https://picsum.photos/800',
    'https://picsum.photos/900',
    'https://picsum.photos/700',
    'https://picsum.photos/1000',
    'https://picsum.photos/1100',
  ];

  void _incrementCounter() {
    setState(() {
      _counter = (_counter + 1) % images.length;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = (_counter - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Image.network(images[_counter],
                height: 0.7 * height, fit: BoxFit.cover),*/
            InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 4,
              child: Image.network(
                images[_counter],
                //width: 200,
                height: height * 0.7,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrementCounter, child: Text('-')),
                Text("$_counter", style: TextStyle(fontSize: 14)),
                ElevatedButton(onPressed: _incrementCounter, child: Text('+'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
