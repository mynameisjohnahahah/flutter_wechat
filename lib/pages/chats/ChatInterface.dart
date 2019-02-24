import 'package:flutter/material.dart';

class ChatInterface extends StatefulWidget {
  ChatInterface({Key key, @required this.id}):super(key: key);
  final id;

  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  var maxScrollExtent;

  ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      // autofocus: true, // 对焦
    );
  }

  // 聊天界面 根据id自己的在右边，别人消息在左边


  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.addListener(() {
      // _controller.animateTo(maxScrollExtent,
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease
      // );
      print('input ${controller.text}');
    });
    
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print('more');
            },
          )
        ],
        title: Text('刘希鹏', style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Scrollbar(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  maxScrollExtent = notification.metrics.maxScrollExtent; // 最大滚动长度
                },
                child: PageView(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: 100,
                      itemExtent: 50.0,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        // return ListTile(title: Text("$index"));
                        return Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Image.network(
                                  'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                ),
                                // margin: EdgeInsets.only(right: 10.0),
                                width: 50.0,
                                height: 50.0,
                              ),
                              Container(
                                child: Text(
                                  '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试',
                                ),
                                width: 120.0,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red
                          ),
                          padding: EdgeInsets.only(top: 0.0, left: 10.0),
                        );
                      }
                    ),
                  ],
                )
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  child: Icon(Icons.ac_unit),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                ),
                Expanded(
                  child: buildTextField(controller),
                ),
                Padding(
                  child: Icon(Icons.tag_faces),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                ),
                Padding(
                  child: Icon(Icons.add_circle_outline),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                ),
              ],
            ),
            height: 50.0,
          )
        ],
      )
    );
  }
}