import 'package:flutter/material.dart';
import 'package:serviscim_app/models/user.dart';
import 'package:serviscim_app/src/constant.dart';
import 'package:serviscim_app/src/user_services.dart';
import 'package:serviscim_app/widgets/avatar_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:serviscim_app/widgets/progress_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<FormState> formkey = GlobalKey(debugLabel: "Form");
  String _email = '';
  String _name = '';
  String _phone = '';
  String _telephone = '';
  String _company = '';
  String _address = '';
  String _website = '';
  String _logo = '';
  bool _loading = false;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerTelephone = TextEditingController();
  TextEditingController controllerCompany = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerWebsite = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: ProgressWidget(),
          )
        : Scaffold(
            body: FutureBuilder<User>(
              future: userServices()
                  .getUser(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return Form(
                    key: formkey,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      physics: BouncingScrollPhysics(),
                      children: [
                        ProfileWidget(
                            imagePath:
                                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
                            onClicked: () {}),
                        const SizedBox(
                          height: 24,
                        ),
                        _builName(snapshot.data!.adSoyad),
                        const SizedBox(
                          height: 24,
                        ),
                        _builEmail(snapshot.data!.email),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildPhone(snapshot.data!.cepTelefonu),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildTelephone(snapshot.data!.sabitTel),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildCompany(snapshot.data!.firmaAdi),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildAddress(snapshot.data!.adres),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildWebsite(snapshot.data!.webSite),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState?.save();

                              _updateProfile();
                            }
                          },
                          child: Container(
                            height: 50,
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
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: ProgressWidget(),
                  );
                }
              },
            ),
          );
  }

  Widget _builEmail(email) {
    controllerEmail.text = email;
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan zorunludur';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          _email = value!;
        });
      },
      decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerEmail,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _builName(name) {
    controllerName.text = name;
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan zorunludur';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          _name = value!;
        });
      },
      decoration: const InputDecoration(
          labelText: 'Ad Soyad',
          hintText: 'Ad Soyad',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerName,
    );
  }

  Widget _buildPhone(phone) {
    controllerPhone.text =
        phone.toString() == 'null' ? ''.toString() : phone.toString();
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _phone = value!;
        });
      },
      decoration: const InputDecoration(
          labelText: 'Cep Telefonu',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerPhone,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildTelephone(telephone) {
    controllerTelephone.text =
        telephone.toString() == 'null' ? ''.toString() : telephone.toString();
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _telephone = value!;
        });
      },
      decoration: const InputDecoration(
          labelText: 'Sabit Telefon',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerTelephone,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildCompany(company) {
    controllerCompany.text =
        company.toString() == 'null' ? ''.toString() : company.toString();
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _company = value!;
        });
      },
      decoration: const InputDecoration(
          labelText: 'Firma Adı',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerCompany,
    );
  }

  Widget _buildAddress(address) {
    controllerAddress.text =
        address.toString() == 'null' ? ''.toString() : address.toString();
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _address = value!;
        });
      },
      maxLines: 4,
      decoration: const InputDecoration(
          labelText: 'Adres',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0, top: 15),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerAddress,
    );
  }

  Widget _buildWebsite(website) {
    controllerWebsite.text =
        website.toString() == 'null' ? ''.toString() : website.toString();
    return TextFormField(
      onSaved: (value) {
        //setState(() {
        _website = value!;
        //});
      },
      decoration: const InputDecoration(
          labelText: 'Website',
          //hintText: '',
          hintStyle: TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(left: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      controller: controllerWebsite,
    );
  }

  void _updateProfile() async {
    setState(() {
      _loading = true;
    });
    User user = User(
      adSoyad: _name,
      email: _email,
      cepTelefonu: _phone,
      sabitTel: _telephone,
      firmaAdi: _company,
      adres: _address,
      webSite: _website,
      //logo: _logo
    );
    await userServices().saveUserData(user);
    setState(() {
      _loading = false;
    });
  }
}
