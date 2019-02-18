import 'package:flutter/material.dart';

class BHomeScreen extends StatefulWidget {
  _BHomeScreenState createState() => _BHomeScreenState();
}

class _BHomeScreenState extends State<BHomeScreen> {
  static List tabData = [
    { "label": "A", "data": [{"name": "A1"},{"name": "A1"},{"name": "A1"},{"name": "A1"}] },
    { "label": "B", "data": [{"name": "B1"},{"name": "B1"},{"name": "B1"},{"name": "B1"},{"name": "B1"}] },
    { "label": "C", "data": [{"name": "C1"},{"name": "C1"},{"name": "C1"},{"name": "C1"}] },
    { "label": "D", "data": [{"name": "D1"},{"name": "D1"},{"name": "D1"},{"name": "D1"}] },
    { "label": "E", "data": [{"name": "E1"},{"name": "E1"},{"name": "E1"},{"name": "E1"}] },
    { "label": "F", "data": [{"name": "F1"},{"name": "F1"},{"name": "F1"},{"name": "F1"}] },
    { "label": "G", "data": [{"name": "G1"},{"name": "G1"},{"name": "G1"},{"name": "G1"}] },
    { "label": "H", "data": [{"name": "H1"},{"name": "H1"},{"name": "H1"},{"name": "H1"}] },
    { "label": "I", "data": [{"name": "I1"},{"name": "I1"},{"name": "I1"},{"name": "I1"}] },
    { "label": "J", "data": [{"name": "J1"},{"name": "J1"},{"name": "J1"},{"name": "J1"}] },
    { "label": "K", "data": [{"name": "K1"},{"name": "K1"},{"name": "K1"},{"name": "K1"}] },
    { "label": "L", "data": [{"name": "L1"},{"name": "L1"},{"name": "L1"},{"name": "L1"}] },
    { "label": "M", "data": [{"name": "M1"},{"name": "M1"},{"name": "M1"},{"name": "M1"}] },
    { "label": "N", "data": [{"name": "N1"},{"name": "N1"},{"name": "N1"},{"name": "N1"}] },
    { "label": "O", "data": [{"name": "O1"},{"name": "O1"},{"name": "O1"},{"name": "O1"}] },
    { "label": "P", "data": [{"name": "P1"},{"name": "P1"},{"name": "P1"},{"name": "P1"}] },
    { "label": "Q", "data": [{"name": "Q1"},{"name": "Q1"},{"name": "Q1"},{"name": "Q1"}] },
    { "label": "R", "data": [{"name": "R1"},{"name": "R1"},{"name": "R1"},{"name": "R1"}] },
    { "label": "S", "data": [{"name": "S1"},{"name": "S1"},{"name": "S1"},{"name": "S1"}] },
    { "label": "T", "data": [{"name": "T1"},{"name": "T1"},{"name": "T1"},{"name": "T1"}] },
    { "label": "U", "data": [{"name": "U1"},{"name": "U1"},{"name": "U1"},{"name": "U1"}] },
    { "label": "V", "data": [{"name": "V1"},{"name": "V1"},{"name": "V1"},{"name": "V1"}] },
    { "label": "W", "data": [{"name": "W1"},{"name": "W1"},{"name": "W1"},{"name": "W1"}] },
    { "label": "X", "data": [{"name": "X1"},{"name": "X1"},{"name": "X1"},{"name": "X1"}] },
    { "label": "Y", "data": [{"name": "Y1"},{"name": "Y1"},{"name": "Y1"},{"name": "Y1"}] },
    { "label": "Z", "data": [{"name": "Z1"},{"name": "Z1"},{"name": "Z1"},{"name": "Z1"}] },
    { "label": "#", "data": [{"name": "%%"},{"name": "--"},{"name": "&&"},{"name": "@！@"}] },
  ];

  static List indexList = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"];

  var allHeight = 0;
  var heightArr = [0, 45];

  Widget buildList() {
    List<Widget> tiles = [];
    Widget content;

    for(var item in tabData) {
      for(var i = -1; i < item["data"].length; i++) {
        tiles.add(
          i == -1
            ? Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Align(
                    alignment: FractionalOffset.topLeft,
                    child: Text(
                      item["label"], 
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
              )
            : GestureDetector(
                onTap: () {
                  print('目前:');
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                          'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                          scale: 1.0,
                          fit: BoxFit.cover,
                        ),
                        width: 50.0,
                        height: 50.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    item["data"][i]["name"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19.0
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          height: 60.0,
                          padding: const EdgeInsets.only(right: 10.0),
                          margin: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[300],
                            ))
                          ),
                        )
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                ),
              )
        );
      }
    }

    content = Column(
      children: tiles,
    );
    return content;
  }

  Widget buildIndex() {
    var stack = Stack(
      children: <Widget>[
        Text('qwe'),
        Positioned(
          right: 0,
          left: 0,
          top: 5,
          child: Text('qqq'),
        )
      ],
    );

    return stack;
  }

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      // print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  void jisuan() {
    tabData.asMap().forEach((i, item) {
      // item["data"].length * 90 + 35; // 这个是一个分区的总高度
      heightArr.add((item["data"].length * 78.75 + 35 + heightArr[heightArr.length - 1].toDouble()).toInt());
      // i == 0
      //   ? heightArr.add((item["data"].length * 78.75 + heightArr[heightArr.length - 1].toDouble()).toInt())
      //   : heightArr.add((item["data"].length * 78.75 + 35 + heightArr[heightArr.length - 1].toDouble()).toInt());
      // heightArr.add(item["data"].length * 90 + heightArr[heightArr.length - 1]);
    });
  }

  Widget build(BuildContext context) {
    jisuan();
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey[300], // 设置标题栏的背景颜色
        title: new Title(
          child:new Text(
            'Contacts',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          color: Colors.black,// 设置标题栏文字的颜色(new title的时候color不能为null不然会报错一般可以不用new title 直接new text,不过最终的文字里面还是以里面new text的style样式文字颜色为准)
        ),
        centerTitle: true, // 设置标题居中
        elevation: 0.0, // 设置标题栏下面阴影的高度
        primary: true, // 是否设置内容避开状态栏
        actions: <Widget>[ // 设置显示在右边的控件
          new Padding(
            child: new Icon(Icons.add, color: Colors.black,),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Scrollbar(
            child: SingleChildScrollView(
              controller: _controller,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.grey,),
                            Text('Search', style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                      ),
                      buildList()
                    ],
                  ),
                ],
              )
            )
          ),
          Positioned(
            right: 0,
            top: 50,
            child: SizedBox(
              height: 1200.0,
              width: 20.0,
              child: ListView.builder(
                itemCount: indexList.length + 1,
                itemBuilder: (context, int index) {
                  return index == 0
                    ? GestureDetector(
                        onTap: () {
                          // print('回到顶部');
                          print(heightArr);
                          _controller.animateTo(0.0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease
                          );
                        },
                        child: Text('~'),
                      )
                    : GestureDetector(
                        onTap: () {
                          // 395.0
                          // print(tabData[index]["data"].length);

                          // 这里要计算每个label的高度 比如A是350 B是360那么B也要加上A的高度就是710

                          print(tabData[index]["data"].length * 90);
                          _controller.animateTo(heightArr[index].toDouble(),
                          // _controller.animateTo(1128.75,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease
                          );
                        },
                        child: Text(indexList[index - 1]),
                      );
                },
              ),
            )
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}