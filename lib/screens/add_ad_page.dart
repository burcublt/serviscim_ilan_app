import 'package:flutter/material.dart';
import 'package:serviscim_app/screens/arac_is_ekle.dart';
import 'package:serviscim_app/screens/login.dart';
import 'package:serviscim_app/src/user_preferences.dart';

class AddAdPage extends StatefulWidget {
  const AddAdPage({Key? key}) : super(key: key);

  @override
  _AddAdPageState createState() => _AddAdPageState();
}

class _AddAdPageState extends State<AddAdPage> {
  var token = UserPreferences.getToken();

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   token = null;
    // });
    return Scaffold(body: token == null ? getloginpage() : getAddType());
  }

  Widget getloginpage() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Text('İlan eklemek için giriş yapmanız gerekmektedir.'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('Giriş Yap'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            )
          ],
        ),
      ),
    );
  }

  Widget getAddType() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 20),
            child: Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: <Widget>[
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AracIsEklePage()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        color: Color.fromARGB(255, 254, 211, 202),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/car.png'),
                                ),
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 252, 176, 160),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Aracıma iş arıyorum',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      color: Color.fromARGB(255, 149, 191, 249),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/buscolor.png'),
                              ),
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 78, 139, 220),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'İşime araç arıyorum',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      color: Color.fromARGB(255, 253, 181, 192),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/driver.png'),
                              ),
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 241, 129, 145),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Aracıma şoför arıyorum',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      color: Color.fromARGB(255, 182, 248, 244),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/document.png'),
                              ),
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 40, 197, 184),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Şoförüm iş arıyorum',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      color: Color.fromRGBO(255, 241, 146, 1),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/driving-school.png'),
                              ),
                              radius: 30,
                              backgroundColor: Color.fromRGBO(255, 221, 60, 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Özel Günüme Araç arıyorum',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
