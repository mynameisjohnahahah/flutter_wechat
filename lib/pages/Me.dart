import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  static List tabData = [
    { "title": 'Wechat Pay', "icon": Icon(Icons.check_circle) },
    { "title": 'Favorites', "icon": Icon(Icons.crop_free) },
    { "title": 'My Posts', "icon": Icon(Icons.favorite_border) },
    { "title": 'Cards & Offers', "icon": Icon(Icons.camera) },
    { "title": 'Sticker Gallery', "icon": Icon(Icons.search) },
    { "title": 'Settings', "icon": Icon(Icons.people) },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      'https://b-ssl.duitang.com/uploads/item/201509/24/20150924190747_8dVyu.jpeg',
                      scale: 1.0,
                      fit: BoxFit.cover,
                    ),
                    width: 60.0,
                    height: 60.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Align(
                                    alignment: FractionalOffset.topLeft,
                                    child: Text(
                                      'lxp',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0
                                      ),
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    'Wechat ID: JP3013229917',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.grey[400]
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topRight,
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0)
                    )
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              height: 90.0,
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
            ),
            color: Colors.white,
            height: 120.0
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: tabData.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {
                    print('第${i}个');
                  },
                  child: Container(
                    padding: i == 0 || i + 1 == tabData.length
                            ? const EdgeInsets.only(top: 10.0, bottom: 10.0)
                            : const EdgeInsets.only(top: 0.0),
                    child: Container(
                      height: 50.0,
                      child: ListTile(
                        leading: tabData[i]['icon'],
                        title: Text(tabData[i]['title'])
                      ),
                      color: Colors.white
                    )
                  )
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200]
    );
  }
}