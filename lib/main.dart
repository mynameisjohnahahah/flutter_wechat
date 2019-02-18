import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'first_screen_animation.dart';
import './model/counter_model.dart';

void main() {
  runApp(MyApp(
    model: CounterModel(),
  ));
}

class MyApp extends StatelessWidget {
  final CounterModel model;

  const MyApp({Key key,@required this.model}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch:Colors.blue,
        ),
        home: SplashScreen()
      )
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';
// import './model/counter_model.dart';
// import './count_page.dart';

// void main() {
//   runApp(MyApp(
//     model: CounterModel(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   final CounterModel model;

//   const MyApp({Key key,@required this.model}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel(
//       model: model,
//       child: MaterialApp(
//         title: 'Scoped Model Demo',
//         home: CountPage(),
//       ),
//     );
//   }
// }
