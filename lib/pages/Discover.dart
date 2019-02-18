import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  static List tabData = [
    { "title": 'Moments', "icon": Icon(Icons.camera) },
    { "title": 'Scan', "icon": Icon(Icons.crop_free) },
    { "title": 'Shake', "icon": Icon(Icons.favorite_border) },
    { "title": 'Top Stories', "icon": Icon(Icons.camera) },
    { "title": 'Search', "icon": Icon(Icons.search) },
    { "title": 'People NearBy', "icon": Icon(Icons.people) },
    { "title": 'Games', "icon": Icon(Icons.games) },
    { "title": 'MiniPrograms', "icon": Icon(Icons.apps) },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: ListView.builder(
        itemCount: tabData.length,
        itemBuilder: (context, int index) {
          return Container(
            padding: index % 2 == 0
                    ? const EdgeInsets.only(top: 0.0)
                    : const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 50.0,
              child: ListTile(
                leading: tabData[index]['icon'],
                title: Text(tabData[index]['title'])
              ),
              color: Colors.white
            )
          );
        },
      ),
      backgroundColor: Colors.grey[200]
    );
  }
}