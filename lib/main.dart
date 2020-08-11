import 'reaction_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reactions by Flutter',
        theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.red),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('MAIN'),
              centerTitle: true,
            ),
            body: MainScreen()));
  }
}

class MainScreen extends StatefulWidget {
  @override
  State createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  static List<double> timeDelays = [1.0, 2.0, 3.0, 4.0, 5.0];
  int selectedIndex = 0;

  onSpeedSettingPress(int index) {
    timeDilation = timeDelays[index];
    setState(() {
      selectedIndex = index;
    });
  }

  buildList() {
    final List<Widget> list = [
      Text(
        'SPEED:',
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      )
    ];

    timeDelays.asMap().forEach((index, delay) {
      list.add(Container(
        child: GestureDetector(
          onTap: () => onSpeedSettingPress(index),
          child: Container(
            child:
                Text(delay.toString(), style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.deepPurple
                  : Colors.red,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        margin: EdgeInsets.all(5.0),
      ));
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(children: buildList()),
            margin: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 100.0, bottom: 10.0),
          ),
          Container(
            height: 50.0,
          ),
          buildButton(context, 'Linkedin reactions ', ReactionBox())
        ],
      )),
    );
  }

  Widget buildButton(
      BuildContext context, String name, StatelessWidget screenTo) {
    return FlatButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => screenTo)),
      child: Container(
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        width: 270.0,
      ),
      color: Colors.black,
      highlightColor: Colors.blue,
      padding: EdgeInsets.all(15.0),
    );
  }
}
