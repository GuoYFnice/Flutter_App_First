import 'package:flutter/material.dart';

/*
* class_1
* 一个简单的flutter布局练习
*/

// 声明MyApp类
class MyApp extends StatelessWidget {
  //重写build方法
  @override
  Widget build(BuildContext context) {
    //返回一个Material风格的组件
    return MaterialApp(
      title: 'class_1',
      home: Scaffold(
        //创建一个Bar，并添加文本
        appBar: AppBar(
          title: Text('class_1'),
        ),
        //在主体的中间区域，添加一个hello world 的文本
        body: Center(
          child: Container(child: MyList()),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180.0,
          height: 390.0,
          color: Colors.lightBlue,
          child: Text(
            'TEST 1',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
        new Container(
          width: 180.0,
          height: 390.0,
          color: Colors.amber,
          child: Text(
            'TEST 2',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
        new Container(
          width: 180.0,
          height: 390.0,
          color: Colors.deepOrange,
          child: Text(
            'TEST 3',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
        new Container(
          width: 180.0,
          height: 390.0,
          color: Colors.deepPurpleAccent,
          child: Text(
            'TEST 4',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ],
    );
  }
}
