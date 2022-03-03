import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/models/post.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/widgets/appbar_widget.dart';

class PostDetail extends StatefulWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool _isFavorite = false;
  IconData _icon = Icons.star_border_outlined;
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final _markaAdi = widget.post.markaAdi;
    final _modelAdi = widget.post.modelAdi;
    final _aracYili = widget.post.aracYil;
    final _aracKapasite = widget.post.kapasiteAdi;
    final _tecrube = widget.post.tecrube;
    final _baslangicSemt = widget.post.baslangicSemt;
    final _bitisSemt = widget.post.bitisSemt;
    final _servisBasSaati = widget.post.baslamaSaati;
    final _servisBitisSaati = widget.post.bitisSaati;
    final _firmaGirisSaati = widget.post.firmaGirisSaati;
    final _firmaCikisSaati = widget.post.firmaCikisSaati;
    final _gun = widget.post.calismaGunSayisi;
    final _km = widget.post.toplamKm;
    final _odeme = widget.post.odemePeriyodu;
    final _ucret = widget.post.ucret;
    final _firma = widget.post.firma;
    final _cepTel = widget.post.cepTelefonu;
    final _sabitTel = widget.post.sabitTel;
    final _email = widget.post.email;
    final _webSite = widget.post.webSite;
    final _adres = widget.post.adres;

    return Scaffold(
      appBar: appBarFavoriteWidget(context, 'İlan Detay', widget.post),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.post.postTipAdi),
                    const SizedBox(
                      height: 5,
                    ),
                    _firma != null
                        ? Text('$_firma')
                        : const Text('Bireysel Kullanıcı'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Cep Tel: '),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Görüntüleme'),
                        Text('Favori'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('10'),
                        Text('5'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Açıklama'),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(widget.post.aciklama!),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Araç Bilgileri'),
                      const SizedBox(
                        height: 8,
                      ),
                      _markaAdi != null
                          ? Row(
                              children: [Text('Araç Markası: $_markaAdi')],
                            )
                          : const SizedBox(),
                      _modelAdi != null
                          ? Row(
                              children: [Text('Araç Markası: $_modelAdi')],
                            )
                          : const SizedBox(),
                      _aracYili != null
                          ? Row(
                              children: [Text('Araç Yılı: $_aracYili')],
                            )
                          : const SizedBox(),
                      _aracKapasite != null
                          ? Row(
                              children: [Text('Araç Kapasite: $_aracKapasite')],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('İlan Detayları'),
                      const SizedBox(
                        height: 8,
                      ),
                      _tecrube != null
                          ? Row(
                              children: [Text('Tecrube: $_tecrube')],
                            )
                          : const SizedBox(),
                      _baslangicSemt != null
                          ? Row(
                              children: [
                                Text('Başlangıç Semti: $_baslangicSemt')
                              ],
                            )
                          : const SizedBox(),
                      _bitisSemt != null
                          ? Row(
                              children: [Text('Başlangıç Semti: $_bitisSemt')],
                            )
                          : const SizedBox(),
                      _servisBasSaati != null
                          ? Row(
                              children: [
                                Text('Servis Başlama Saati: $_servisBasSaati')
                              ],
                            )
                          : const SizedBox(),
                      _servisBitisSaati != null
                          ? Row(
                              children: [
                                Text('Servis Bitiş Saati: $_servisBitisSaati')
                              ],
                            )
                          : const SizedBox(),
                      _firmaGirisSaati != null
                          ? Row(
                              children: [
                                Text('Firma Giriş Saati: $_firmaGirisSaati')
                              ],
                            )
                          : const SizedBox(),
                      _firmaCikisSaati != null
                          ? Row(
                              children: [
                                Text('Firma Çıkış Saati: $_firmaCikisSaati')
                              ],
                            )
                          : const SizedBox(),
                      _gun != null
                          ? Row(
                              children: [Text('Çalışma günü: $_gun')],
                            )
                          : const SizedBox(),
                      _km != null
                          ? Row(
                              children: [Text('Mesafe (KM): $_km')],
                            )
                          : const SizedBox(),
                      _odeme != null
                          ? Row(
                              children: [Text('Ödeme: $_odeme')],
                            )
                          : const SizedBox(),
                      _ucret != null
                          ? Row(
                              children: [Text('Ücret : $_ucret')],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Firma Bilgileri'),
                      const SizedBox(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _cepTel != null
                          ? Row(
                              children: [Text('Cep Telefonu: $_cepTel')],
                            )
                          : const SizedBox(),
                      _sabitTel != null
                          ? Row(
                              children: [Text('Sabit Tel: $_sabitTel')],
                            )
                          : const SizedBox(),
                      _email != null
                          ? Row(
                              children: [Text('Email: $_email')],
                            )
                          : const SizedBox(),
                      _webSite != null
                          ? Row(
                              children: [Text('Web Site: $_webSite')],
                            )
                          : const SizedBox(),
                      _adres != null
                          ? Row(
                              children: [Text('Adres: $_adres')],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
