import 'package:flutter/material.dart';
import 'chats/ChatInterface.dart';

class Chats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wechat(12)'),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ChatInterface(id: 'test1')
              ));
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
                    width: 40.0,
                    height: 40.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    'flutter知识',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topRight,
                                child: Text('9:00'),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    '21111111111111122221111111111113111111111',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topRight,
                                child: Text('9:00'),
                              ),
                            ],
                          )
                        ],
                      ),
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
              height: 70.0,
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            ),
          );
        },
      ),
    );
  }
}

