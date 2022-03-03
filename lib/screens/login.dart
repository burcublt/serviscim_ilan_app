import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:serviscim_app/screens/home_page.dart';
import 'package:serviscim_app/screens/register.dart';
import 'package:serviscim_app/src/user_preferences.dart';
import 'dart:async';
import 'dart:convert';
import '../src/constant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey(debugLabel: "Form");
  GlobalKey<ScaffoldState> _statekey = GlobalKey(debugLabel: "state");
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: _statekey,
        body: Form(
          key: formkey,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 120,
                              child: Image.asset('assets/bus.png'),
                            ),
                            SizedBox(height: 30),
                            Container(
                                child: Text(
                              'Hoşgeldiniz',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Poppins-Black',
                                //fontStyle: FontStyle.italic,
                              ),
                            )),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _builEmail(),
                                    SizedBox(height: 15),
                                    _buildPassword()
                                  ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                'Şifremi unuttum?',
                                style: TextStyle(
                                    fontFamily: 'Varela Round',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ),
                            SizedBox(height: 30),
                            loginButton(),
                            SizedBox(height: 20),
                            routeRegisterButton(),
                            const SizedBox(
                              height: 10,
                            ),
                            routeHomeButton()
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _builEmail() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email adresinizi giriniz';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _email = value!;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Email adresiniz',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(),
        ),
        controller: controllerEmail,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Şifrenizi giriniz';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _password = value!;
          });
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Şifre',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(),
        ),
        controller: controllerPassword,
      ),
    );
  }

  Future _login() async {
    var jsonData;
    print('object');
    await http.post(Uri.parse(loginUrl),
        body: json.encode({'email': _email, 'password': _password}),
        headers: {"Content-type": "application/json"}).then((response) {
      if (response.statusCode == 401) {
        // _statekey.currentState.showSnackBar(new SnackBar(
        //   content: new Text(
        //     'Hatalı giriş yaptınız',
        //     textAlign: TextAlign.center,
        //   ),
        //   duration: Duration(seconds: 5),
        // ));
      } else {
        jsonData = json.decode(response.body);
        UserPreferences.setEmail(_email);
        UserPreferences.setToken(jsonData['token']);
        //postPushToken(pushToken, jsonData['data']['id']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
      }
    }).catchError((err) {
      // _statekey.currentState.showSnackBar(new SnackBar(
      //   content: new Text(
      //     'Hatalı giriş yaptınız',
      //     textAlign: TextAlign.center,
      //   ),
      //   duration: Duration(seconds: 5),
      // ));
    });
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState?.save();
          _login();
        }
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor),
        child: const Center(
          child: Text(
            "Giriş",
            style: TextStyle(
                fontFamily: 'Poppins-SemiBold',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget routeRegisterButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: const Text(
          'Hesabınız yokmu ? KAYIT OL',
          style: TextStyle(fontFamily: 'Poppins-SemiBold'),
        ),
      ),
    );
  }

  Widget routeHomeButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: const Text(
          'Giriş Yapmadan Devam Et',
          style: TextStyle(fontFamily: 'Poppins-SemiBold'),
        ),
      ),
    );
  }
}
