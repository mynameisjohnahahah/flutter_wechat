import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'utils/http.dart';

// 引用页面
import 'pages/Chats.dart';
import 'pages/b.dart';
import 'pages/Discover.dart';
import 'pages/Me.dart';
import 'pages/SearchBar.dart';

// Dio dio = new Dio();

// 主函数/入口函数
void main() => runApp(MyApp());

// StatelessWidget 静态widget
// StatefulWidget  动态widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter', // 这个title是切换任务的时候显示的title
      theme: ThemeData.light(), // 主题
      home: BottomNavigationWidget()
    );
  }
}

// 动态widget 主要代码在下面的State中
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final bottomNavigationColor = Colors.blue;
  int currentIndex = 0; // 索引
  List<Widget> list = List(); //dart语法：数组是List对象，<类型>
  int index = 0;

  @override
  void initState() {
    // ..级联符号 允许你对上一个对象进行操作，还可以访问同一个对象上的字段
    // 相当于list = [AHomeScreen(), BHomeScreen(), CHomeScreen(), DHomeScreen()];
    list
      ..add(Chats())
      ..add(BHomeScreen())
      // ..add(SearchBar())
      ..add(Discover())
      ..add(Me());
    
    super.initState();
  }

  // void test() async {
  //   var response = await Http().get('/posts', data: {});
  //   print(response);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            title: Text('Chats')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            title: Text('Contacts')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
            ),
            title: Text('Discover')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
            ),
            title: Text('Me')
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          // test();
          setState(() {
            this.currentIndex = index;
            this.index = index;
          });
        },
        type: BottomNavigationBarType.fixed // fixed的效果是固定，每个按钮的字都会显示，shifting的效果是只显示当前的字体，点击换别的会有小小的动画效果
      ),
    );
  }
}