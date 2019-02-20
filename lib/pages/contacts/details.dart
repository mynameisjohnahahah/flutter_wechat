import 'package:flutter/material.dart';

class ContactsDetails extends StatelessWidget {
  final id;
  ContactsDetails({Key key, @required this.id}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print('more');
            },
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                      child: Image.network(
                        'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              '刘希鹏',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(Icons.mood)
                          ],
                        ),
                        Text('Name: 哇哇哇', style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),),
                        Text('Wechat ID: wxid_9928451', style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),),
                        Text('Region: ShenZhen', style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),)
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15.0),
                  )
                ],
              ),
              padding: EdgeInsets.only(right: 25.0),
              margin: EdgeInsets.only(left: 25.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: Colors.grey[300],
                ))
              ),
            ),
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            child: ListTile(
              title: Text('Edit Contact', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
              trailing: Icon(Icons.chevron_right)
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 50.0,
          ),
          Container(
            child: Container(
              child: ListTile(
                leading: Text('Moments', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),),
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(right: 5.0),
                    ),
                    Container(
                      child: Image.network(
                        'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(right: 5.0),
                    ),
                    Container(
                      child: Image.network(
                        'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(right: 5.0),
                    ),
                    Container(
                      child: Image.network(
                        'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(right: 5.0),
                    ),
                  ],
                ),
                trailing: Icon(Icons.chevron_right)
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(
                color: Colors.grey[300],
              ))
            ),
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          ),
          Container(
            child: ListTile(
              title: Text('More', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
              trailing: Icon(Icons.chevron_right)
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 50.0,
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.chat_bubble),
                  ),
                  Text('Messages', style: TextStyle(color: Color.fromRGBO(31, 76, 103, 1), fontSize: 18.0, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(
                color: Colors.grey[300],
              ))
            ),
            height: 50.0,
            margin: EdgeInsets.only(top: 10.0),
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.videocam),
                  ),
                  Text('Voice or Video Call', style: TextStyle(color: Color.fromRGBO(31, 76, 103, 1), fontSize: 18.0, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 50.0,
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}