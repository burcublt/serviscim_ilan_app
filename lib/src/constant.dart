import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const String baseUrl = "http://localhost:8080";
const String getUserDataUrl = "$baseUrl/api/details";
const String sehirUrl = "$baseUrl/api/sehir";
const String getUserFavoriteUrl = "$baseUrl/api/getuserfavorite";
const String loginUrl = "$baseUrl/api/login";
const String postDetailUrl = "$baseUrl/api/postdetail";
const String addFavUrl = "$baseUrl/api/addfavorite";
const String getPostUrl = "$baseUrl/api/postlist";
const String saveUserUrl = "$baseUrl/api/save";
const String registerUrl = "$baseUrl/api/register";
const String pushTokenUrl = "$baseUrl/api/addPushToken";
const String logoutUrl = "$baseUrl/api/logout";
const String addFirmaTakipUrl = "$baseUrl/api/addFirmaTakip";
const String getFirmaBilgiUrl = "$baseUrl/api/getFirmaBilgi";
const String getuserPostUrl = "$baseUrl/api/userpostlist";

Future postPushToken(pushToken, id) async {
  print(pushToken);
  print(id);
  await http.post(Uri.parse(pushTokenUrl),
      body: json.encode({'push_token': pushToken, 'kullanici_id': id}),
      headers: {"Content-type": "application/json"}).then((response) {
    print(response.statusCode);
  });
}
