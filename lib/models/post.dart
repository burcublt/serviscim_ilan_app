class Post {
  late int id;
  late String? firma;
  late String tarih;
  late String postTipAdi;
  late int postTipId;
  late String? kapasiteAdi;
  late String? markaAdi;
  late String? modelAdi;
  late String? aciklama;
  late String? aracYil;
  late String? tecrube;
  late String? baslangicSemt;
  late String? bitisSemt;
  late int? isFavorite;
  late String? referans;
  late String? baslamaSaati;
  late String? bitisSaati;
  late String? ucret;
  late int? yas;
  late String? firmaGirisSaati;
  late String? firmaCikisSaati;
  late int? calismaGunSayisi;
  late int? toplamKm;
  late String? odemePeriyodu;
  late String? cepTelefonu;
  late String? sabitTel;
  late String? email;
  late String? adres;
  late String? webSite;

  Post(
      {required this.id,
      this.firma,
      required this.tarih,
      required this.postTipAdi,
      required this.postTipId,
      this.kapasiteAdi,
      this.markaAdi,
      this.modelAdi,
      this.aciklama,
      this.aracYil,
      this.baslangicSemt,
      this.bitisSemt,
      this.tecrube,
      this.isFavorite,
      this.referans,
      this.baslamaSaati,
      this.bitisSaati,
      this.ucret,
      this.yas,
      this.firmaGirisSaati,
      this.firmaCikisSaati,
      this.calismaGunSayisi,
      this.odemePeriyodu,
      this.toplamKm,
      this.adres,
      this.cepTelefonu,
      this.email,
      this.sabitTel,
      this.webSite});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firma = json['firma'];
    tarih = json['tarih'];
    postTipAdi = json['post_tip_adi'];
    postTipId = json['post_tip_id'];
    kapasiteAdi = json['kapasite_adi'];
    markaAdi = json['marka_adi'];
    modelAdi = json['model_adi'];
    aciklama = json['aciklama'];
    aracYil = json['arac_yil'];
    tecrube = json['tecrube'];
    baslangicSemt = json['baslangic_semt'];
    bitisSemt = json['bitis_semt'];
    isFavorite = json['is_favorite'];
    referans = json['referans'];
    baslamaSaati = json['baslama_saati'];
    bitisSaati = json['bitis_saati'];
    ucret = json['ucret'];
    yas = json['yas'];
    firmaGirisSaati = json['firma_giris_saati'];
    firmaCikisSaati = json['firma_cikis_saati'];
    calismaGunSayisi = json['calisma_gun_sayisi'];
    toplamKm = json['toplam_km'];
    odemePeriyodu = json['odeme_periyodu'];
    adres = json['adres'];
    cepTelefonu = json['cepTelefonu'];
    email = json['email'];
    sabitTel = json['sabitTel'];
    webSite = json['webSite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firma'] = this.firma;
    data['tarih'] = this.tarih;
    data['post_tip_adi'] = this.postTipAdi;
    data['post_tip_id'] = this.postTipId;
    data['kapasite_adi'] = this.kapasiteAdi;
    data['marka_adi'] = this.markaAdi;
    data['model_adi'] = this.modelAdi;
    data['aciklama'] = this.aciklama;
    data['arac_yil'] = this.aracYil;
    data['tecrube'] = this.tecrube;
    data['baslangic_semt'] = this.baslangicSemt;
    data['bitis_semt'] = this.bitisSemt;
    data['is_favorite'] = this.isFavorite;
    data['referans'] = this.referans;
    data['baslama_saati'] = this.baslamaSaati;
    data['bitis_saati'] = this.bitisSaati;
    data['ucret'] = this.ucret;
    data['yas'] = this.yas;
    data['firma_giris_saati'] = this.firmaGirisSaati;
    data['firma_cikis_saati'] = this.firmaCikisSaati;
    data['calisma_gun_sayisi'] = this.calismaGunSayisi;
    data['toplam_km'] = this.toplamKm;
    data['odeme_periyodu'] = this.odemePeriyodu;
    data['adres'] = this.adres;
    data['cep_telefonu'] = this.cepTelefonu;
    data['email'] = this.email;
    data['sabit_tel'] = this.sabitTel;
    data['web_site'] = this.webSite;

    return data;
  }
}
