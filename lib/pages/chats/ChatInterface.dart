import 'package:flutter/material.dart';
import 'package:socket_flutter_plugin/socket_flutter_plugin.dart';
import 'dart:async';

class ChatInterface extends StatefulWidget {
  ChatInterface({Key key, @required this.id}):super(key: key);
  final id;

  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  var maxScrollExtent;
  String _platformVersion = 'Unknown';

  ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    initPlatformState();
  }
  
   Future<void> initPlatformState() async {
    try {
      SocketFlutterPlugin myIO = new SocketFlutterPlugin();
      myIO.socket("http://119.29.119.87:8765/");
      myIO.connect();
      String jsonData =
              '{"content":"test"}';
      myIO.emit("send",jsonData);
      myIO.on("getMsg",(data){
        debugPrint(data.toString());
      });
    } catch(error) {
      _platformVersion = 'Failed to get platform version.';
    }
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      // autofocus: true, // 对焦
    );
  }

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
                      itemCount: 20,
                      // itemExtent: 50.0,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        // return ListTile(title: Text("$index"));
                        return Container(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: new Wrap(
                              alignment: WrapAlignment.start,
                              children: <Widget>[
                                new Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  child: new CircleAvatar(child: new Text('rrr')),
                                ),
                                Container(
                                  child: Text(
                                    'qqqqwrrrrrrrrrrrrrrrrrwwwq465r4qw65r4qw654rqw64r4',
                                    softWrap: true,
                                  ),
                                  width: 250
                                )
                                // RaisedButton(
                                //   onPressed: () {
                                //     FocusScope.of(context).requestFocus(FocusNode());
                                //   },
                                //   child: Text('qwer'),
                                // )
                              ]
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          padding: EdgeInsets.only(top: 0.0, left: 10.0),
                        );
                      },
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