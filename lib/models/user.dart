class User {
  //int? id;
  late String adSoyad;
  late String? firmaAdi;
  late String? cepTelefonu;
  late String? sabitTel;
  late int? ilId;
  late int? ilceId;
  late String? email;
  late String? adres;
  late String? webSite;
  late String? logo;
  //String? pushToken;

  User({
    //this.id,
    required this.adSoyad,
    this.firmaAdi,
    required this.cepTelefonu,
    this.sabitTel,
    this.ilId,
    this.ilceId,
    required this.email,
    this.adres,
    this.webSite,
    this.logo,
    //this.pushToken,
  });

  User.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    adSoyad = json['ad_soyad'];
    firmaAdi = json['firma_adi'];
    cepTelefonu = json['cep_telefonu'];
    sabitTel = json['sabit_tel'];
    ilId = json['il_id'];
    ilceId = json['ilce_id'];
    email = json['email'];
    adres = json['adres'];
    webSite = json['web_site'];
    logo = json['logo'];
    //pushToken = json['push_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['id'] = this.id;
    data['ad_soyad'] = this.adSoyad;
    data['firma_adi'] = this.firmaAdi;
    data['cep_telefonu'] = this.cepTelefonu;
    data['sabit_tel'] = this.sabitTel;
    //data['il_id'] = this.ilId;
    //data['ilce_id'] = this.ilceId;
    data['email'] = this.email;
    data['adres'] = this.adres;
    data['web_site'] = this.webSite;
    //data['logo'] = this.logo;
    //data['push_token'] = this.pushToken;
    return data;
  }
}
