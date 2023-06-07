
import 'package:flutter/material.dart';
import 'package:frefresh/frefresh.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FRefreshController controller = FRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            'FRefresh',
          ),
          centerTitle: true,
        ),
        body: FRefresh(
          controller: controller,
          header: Container(
            width: size.width,
            height: 80,
            child: Icon(Icons.refresh, size: 30,)
          ),
          footer: Container(),
          headerHeight: 80.0,
          child: Container(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(color: Colors.amber, height: 30),
                Container(color: Colors.black87, height: 30),
                Container(color: Colors.redAccent, height: 30),
                Container(color: Colors.green, height: 30),
                Container(color: Colors.amberAccent, height: 30),
                Container(color: Colors.deepOrange, height: 30),
                Container(color: Colors.deepPurpleAccent, height: 30)
              ],
            ),
          ),
          onRefresh: () async {
            print("###> onRefresh");

            await Future.delayed(Duration(seconds: 3));
            if(mounted)setState(() { });
            controller.finishRefresh();
          },
        )
      ),
    );
  }

}
