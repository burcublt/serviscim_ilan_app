import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/models/post.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/screens/post_detail.dart';
import 'package:serviscim_app/widgets/progress_widget.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
        builder: (_, provider, __) => provider.isPostProcessing
            ? const Center(
                child: ProgressWidget(),
              )
            : provider.postFavoriteListLenght > 0
                ? Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: provider.postFavoriteListLenght,
                          itemBuilder: (context, index) {
                            Post favoritetem =
                                provider.getFavoriteByIndex(index);
                            return favoriCardWidget(favoritetem);
                          }),
                    ),
                  )
                : const Center(
                    child: Text("Nothing to show"),
                  ));
  }

  Widget favoriCardWidget(favoritetem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostDetail(
                    post: favoritetem,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(favoritetem.postTipAdi),
                  Text(favoritetem.tarih)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Konum: '),
                      Text(
                          '${favoritetem.baslangicSemt} / ${favoritetem.bitisSemt}')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              favoritetem.markaAdi != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Marka: ${favoritetem.markaAdi}'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Model: ${favoritetem.modelAdi}'),
                      ],
                    )
                  : SizedBox(),
              favoritetem.markaAdi != null
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              Text(
                'Açıklama: ${favoritetem.aciklama}',
                overflow: TextOverflow.fade,
                softWrap: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
