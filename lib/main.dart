import 'package:flutter/material.dart';
import 'package:flutter_training/views/basic_widgets/index.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
      routes: {
        'basic_widgets': (context) => BasicWidgetsDemo(),
      },
    );
  }
}

/// 颜色
const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];

/// 例子

const List<Example> EXAMPLES = [
  Example(
      title: '基础组件',
      description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
      routeName: 'basic_widgets')
];

class Example {
  // 标题
  final String title;
  // 描述
  final String description;
  // 路由
  final String routeName;
  const Example({this.title, this.description, this.routeName});
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Training')),
      body: GridView.builder(
      itemCount: EXAMPLES.length,
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16, // 侧轴方向的间距
        mainAxisSpacing: 16, // 主轴方向的间距
        crossAxisCount: 2, // 列数一行有几个子元素
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          color: COLORS[index % COLORS.length],
          onPressed: () =>
              Navigator.pushNamed(context, EXAMPLES[index].routeName),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 标题
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    EXAMPLES[index].title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              // 描述
              Expanded(
                flex: 1,
                child: Text(
                  EXAMPLES[index].description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              )
            ],
          ),
        );
      },
    ),
    );
  }
}
