import 'package:flutter/material.dart';
import './login.dart';
import 'package:flutter_one/utils/api.dart';

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterState createState() =>  _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _phoneState, _pwdState, _rpwdState = false;
  String _checkStr;
  TextEditingController _rpwdcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();

  void _checkPhone() {
    if (_phonecontroller.text.isNotEmpty &&
        _phonecontroller.text.trim().length == 11) {
      _phoneState = true;
    } else {
      _phoneState = false;
    }
  }

  void _checkPwd() {
    if (_pwdcontroller.text.isNotEmpty &&
        _pwdcontroller.text.trim().length >= 6 &&
        _pwdcontroller.text.trim().length <= 10) {
      _pwdState = true;
    } else {
      _pwdState = false;
    }
  }

  void _rcheckPwd() {
    if (_pwdcontroller.text.isNotEmpty &&
        _pwdcontroller.text == _rpwdcontroller.text) {
      _rpwdState = true;
    } else {
      _rpwdState = false;
    }
  }

  Future<void> register(name, passwprd) async {
    // String url = 'https://geffoliu.cn/users';
    var data = {
      "username": _phonecontroller.text,
      "password": _pwdcontroller.text
    };
    // var response = await HttpUtil().post(url, data: data);
    // print(response);

    var response = await Api().register(data);
    if(response['code'] == 1) {
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        child: AlertDialog(
          title:  Text(
            '温馨提示',
            style:  TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          ),
          content:  Text('注册成功！前往登陆吧！'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
            child: Text('确定')),
          ],
        ),
      );
    } else {
      print('注册失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Mean',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Padding(
                    padding: new EdgeInsets.all(30.0),
                    child: new Image.asset(
                      'images/login.jpg',
                      scale: 1.2,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  child: Stack(
                    alignment: Alignment(1.0, 1.0),
                    //statck
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding:  EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                                child: Icon(Icons.perm_identity)
                            ),
                            Expanded(
                              child: TextField(
                                controller: _phonecontroller,
                                keyboardType: TextInputType.phone,
                                decoration:  InputDecoration(
                                  hintText: '请输入用户名',
                                ),
                              ),
                            ),
                          ]),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.black45),
                        onPressed: () {
                          _phonecontroller.clear();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                            child: Icon(Icons.lock)
                        ),
                        Expanded(
                          child: TextField(
                            controller: _pwdcontroller,
                            decoration: InputDecoration(
                              hintText: '请输入密码',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.black45),
                                onPressed: () {
                                  _pwdcontroller.clear();
                                },
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 40.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                            child: Icon(Icons.lock)
                        ),
                        Expanded(
                          child: TextField(
                            controller: _rpwdcontroller,
                            decoration: InputDecoration(
                              hintText: '请确认密码',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.black45),
                                onPressed: () {
                                  _rpwdcontroller.clear();
                                },
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ]),
                ),
                Container(
                  width: 340.0,
                  child: Card(
                    color: Colors.blue,
                    elevation: 16.0,
                    child: FlatButton(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      onPressed: () {
                        _checkPhone();
                        _checkPwd();
                        _rcheckPwd();
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(builder: (context) => MyApp()),
                        //         (route)=> route==null);
                        if (_phoneState && _pwdState && _rpwdState) {
                          print('注册信息没问题');
                          register(_phonecontroller.text, _pwdcontroller.text);
                          return;
                          // Navigator.of(context).pushAndRemoveUntil(
                          //   MaterialPageRoute(builder: (context) => MyApp()),
                          //   (route)=> route==null);
                        } else {
                          if (!_phoneState) {
                            _checkStr = '请输入11位手机号！';
                          } else if (!_pwdState) {
                            _checkStr = '请输入6-10位密码！';
                          } else if(!_rpwdState) {
                            _checkStr = '2次输入的密码不一致！';
                          }
                        }
                        showDialog<Null>(
                          context: context,
                          barrierDismissible: false,
                          child: AlertDialog(
                            title:  Text(
                              '温馨提示',
                              style:  TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            ),
                            content:  Text(_checkStr),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              child: Text('确定')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyHomePage()), 
                          (route) => route == null);
                    },
                    child: Text('立即登陆'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}