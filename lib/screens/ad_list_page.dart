import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/models/post.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/screens/post_detail.dart';
import 'package:serviscim_app/widgets/progress_widget.dart';

class AdListPage extends StatefulWidget {
  const AdListPage({Key? key}) : super(key: key);

  @override
  _AdListPageState createState() => _AdListPageState();
}

class _AdListPageState extends State<AdListPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  List<Tab> _tabList = [
    Tab(
      text: "Tüm ilanlar",
    ),
    Tab(
      text: "Aracıma iş arıyorum",
    ),
    Tab(
      text: "İşime araç arıyorum",
    ),
    Tab(
      text: "Aracım var şoför arıyorum",
    ),
    Tab(
      text: "Şoförüm iş arıyorum",
    ),
    Tab(
      text: "Özel günüme araç arıyorum",
    )
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 6, vsync: this);

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 6, vsync: this);
    }

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    return Consumer<PostProvider>(
        builder: (_, provider, __) => provider.isPostProcessing
            ? Center(child: ProgressWidget())
            : provider.postListLenght > 0
                ? Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: ListView(
                      //shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              tabBarWidget(_tabController),
                              SizedBox(
                                height: 10,
                              ),
                              tabBarChildrenWidget(_tabController, provider),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
                : const Center(
                    child: Text("Nothing to show"),
                  ));
  }

  Widget tabBarWidget(_tabController) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      child: TabBar(
          unselectedLabelColor: Colors.black87,
          indicator: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0)),
          isScrollable: true,
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.only(left: 20, right: 20),
          tabs: _tabList),
    );
  }

  Widget tabBarChildrenWidget(_tabController, provider) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: _tabController,
        children: [
          ilanListesiWidget(provider),
          ilanAracIsListesiWidget(provider),
          ilanIsAracListesiWidget(provider),
          ilanAracSoforListesiWidget(provider),
          ilanSoforIsListesiWidget(provider),
          ilanOzelGunListesiWidget(provider)
        ],
      ),
    );
  }

  Widget ilanListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postListLenght,
        itemBuilder: (context, index) {
          Post postItem = provider.getPostsByIndex(index);
          bool _isfav = provider.isFavaroite(postItem.id);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postItem.postTipAdi),
                        Text(postItem.tarih)
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
                                '${postItem.baslangicSemt} / ${postItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ilanAracIsListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postAracIsListLenght,
        itemBuilder: (context, index) {
          Post postAracIsItem = provider.getPostsAracIsByIndex(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postAracIsItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postAracIsItem.postTipAdi),
                        Text(postAracIsItem.tarih)
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
                                '${postAracIsItem.baslangicSemt} / ${postAracIsItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postAracIsItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postAracIsItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postAracIsItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postAracIsItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postAracIsItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ilanIsAracListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postIsAracListLenght,
        itemBuilder: (context, index) {
          Post postIsAracItem = provider.getIsAracByIndex(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postIsAracItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postIsAracItem.postTipAdi),
                        Text(postIsAracItem.tarih)
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
                                '${postIsAracItem.baslangicSemt} / ${postIsAracItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postIsAracItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postIsAracItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postIsAracItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postIsAracItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postIsAracItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ilanAracSoforListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postAracSoforListLenght,
        itemBuilder: (context, index) {
          Post postAracSoforItem = provider.getAracSoforByIndex(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postAracSoforItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postAracSoforItem.postTipAdi),
                        Text(postAracSoforItem.tarih)
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
                                '${postAracSoforItem.baslangicSemt} / ${postAracSoforItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postAracSoforItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postAracSoforItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postAracSoforItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postAracSoforItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postAracSoforItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ilanSoforIsListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postSoforIsListLenght,
        itemBuilder: (context, index) {
          Post postSoforIsItem = provider.getSoforIsByIndex(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postSoforIsItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postSoforIsItem.postTipAdi),
                        Text(postSoforIsItem.tarih)
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
                                '${postSoforIsItem.baslangicSemt} / ${postSoforIsItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postSoforIsItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postSoforIsItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postSoforIsItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postSoforIsItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postSoforIsItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ilanOzelGunListesiWidget(provider) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: provider.postOzelGunListLenght,
        itemBuilder: (context, index) {
          Post postOzelGunItem = provider.getOzelGunByIndex(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(
                          post: postOzelGunItem,
                        )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(postOzelGunItem.postTipAdi),
                        Text(postOzelGunItem.tarih)
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
                                '${postOzelGunItem.baslangicSemt} / ${postOzelGunItem.bitisSemt}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    postOzelGunItem.markaAdi != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marka: ${postOzelGunItem.markaAdi}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Model: ${postOzelGunItem.modelAdi}'),
                            ],
                          )
                        : SizedBox(),
                    postOzelGunItem.markaAdi != null
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    Text(
                      'Açıklama: ${postOzelGunItem.aciklama}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
