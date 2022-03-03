import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:serviscim_app/models/user.dart';
import 'package:serviscim_app/src/constant.dart';
import 'package:serviscim_app/src/user_preferences.dart';

class userServices {
  String? token = UserPreferences.getToken();

  Future<User> getUser() async {
    var response = await http.post(Uri.parse(getUserDataUrl), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer " + token!
    });

    var jsonData = json.decode(response.body);
    User userdata = User.fromJson(jsonData['data']);
    return userdata;
  }

  Future<User> saveUserData(User user) async {
    var response = await http.post(Uri.parse(saveUserUrl),
        body: jsonEncode({
          'ad_soyad': user.adSoyad,
          'email': user.email,
          'cep_telefonu': user.cepTelefonu,
          'sabit_tel': user.sabitTel,
          'adres': user.adres,
          'firma_adi': user.firmaAdi,
          'web_site': user.webSite,
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token!
        });

    var jsonData = json.decode(response.body);
    User userdata = User.fromJson(jsonData['data']);
    return userdata;
  }
}
