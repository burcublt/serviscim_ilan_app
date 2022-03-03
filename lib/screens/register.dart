import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:serviscim_app/screens/home_page.dart';
import 'package:serviscim_app/screens/login.dart';
import 'package:serviscim_app/src/user_preferences.dart';
import 'package:serviscim_app/widgets/input_decoration.dart';
import 'dart:async';
import 'dart:convert';
import '../src/constant.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey(debugLabel: "Form");
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordAgain = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  late String _email;
  late String _password;
  late String _passwordAgain;
  late String _name;
  late String _phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                                    _buildName(),
                                    SizedBox(height: 15),
                                    _buildEmail(),
                                    SizedBox(height: 15),
                                    _buildPhone(),
                                    SizedBox(height: 15),
                                    _buildPassword(),
                                    SizedBox(height: 15),
                                    _buildPasswordAgain()
                                  ]),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState?.save();
                                  _register();
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Theme.of(context).primaryColor),
                                child: Center(
                                  child: Text(
                                    "Kayıt Ol",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Hesabınız mı var ? Giriş Yap',
                                  style:
                                      TextStyle(fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                            ),
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

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ad Soyad bilginizi giriniz';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _name = value!;
          });
        },
        decoration: const ProjectInputs('Adınız Soyadınız'),
        controller: controllerName,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _buildEmail() {
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
        decoration: const ProjectInputs('Email adresiniz'),
        controller: controllerEmail,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPhone() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Telefon numarınızı giriniz';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _phone = value!;
          });
        },
        decoration: const ProjectInputs('Telefon numaranız'),
        controller: controllerPhone,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            _password = value!;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Şifrenizi giriniz';
          }
          return null;
        },
        obscureText: true,
        decoration: const ProjectInputs('Şifre'),
        controller: controllerPassword,
      ),
    );
  }

  Widget _buildPasswordAgain() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Şifre Tekrarını giriniz';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _passwordAgain = value!;
          });
        },
        obscureText: true,
        decoration: const ProjectInputs('Şifre tekrar'),
        controller: controllerPasswordAgain,
      ),
    );
  }

  Future _register() async {
    var jsonData;

    await http.post(Uri.parse(registerUrl),
        body: json.encode({
          'ad_soyad': _name,
          'email': _email,
          'password': _password,
          'c_password': _passwordAgain,
          'cep_telefonu': _phone
        }),
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
        UserPreferences.setToken(jsonData['token']);
        UserPreferences.setEmail(jsonData['email']);

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
}
