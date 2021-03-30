// 导入包。
import 'package:flutter/material.dart';
/*
* class_2
* 路由相关
*/

// lutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ), //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        // 可以通过这样进行路由传值
        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String routeName = settings.name;
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其它情况则正常打开路由。
      //   });
      // }
      // home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 是Flutter应用的首页，它继承自StatefulWidget类，表示它是一个有状态的组件（Stateful widget）。
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 是 Material 库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性，组件树可以很复杂。本书后面示例中，路由默认都是通过Scaffold创建。
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              textColor: Colors.blue,
              // onPressed: () {
              //   //导航到新路由
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return NewRoute();
              //   }));
              // },
              onPressed: () async {
                // 使用路由名打开新路由页
                // Navigator.pushNamed(context, "new_page");
                // 使用路由名打开路由并且传值
                // Navigator.of(context).pushNamed("new_page", arguments: "hi");

                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(
                        // 路由参数
                        text: "我是提示xxxx",
                      );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
              child: Text("打开提示页"),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 创建一个新路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

// 创建一个接受参数的路由
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // 可以通过这个接受路由传参
    // var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
