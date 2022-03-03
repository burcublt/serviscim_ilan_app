import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/screens/ad_list_page.dart';
import 'package:serviscim_app/screens/add_ad_page.dart';
import 'package:serviscim_app/screens/favorite_page.dart';
import 'package:serviscim_app/screens/login.dart';
import 'package:serviscim_app/screens/profile_page.dart';
import 'package:serviscim_app/src/post_services.dart';
import 'package:serviscim_app/src/user_preferences.dart';
import 'package:serviscim_app/widgets/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final screens = [
    const AdListPage(),
    const Favorite(),
    const AddAdPage(),
    const ProfilePage()
  ];

  _getPostAll() async {
    late var newsResponce;
    String? token = UserPreferences.getToken();
    var provider = Provider.of<PostProvider>(context, listen: false);
    if (token != null) {
      newsResponce = await PostServices().getUserPostsAll();
    } else {
      newsResponce = await PostServices().getPostsAll();
    }
    //var aracIsResponce = await PostServices().getPostsAracIs();
    //var isAracResponce = await PostServices().getPostsIsArac();
    //var aracSoforResponce = await PostServices().getPostAracSofor();
    //var isSoforResponce = await PostServices().getSoforIs();
    //var ozelGunResponce = await PostServices().getOzelGun();
    //var favoriteResponce = await PostServices().getFavorite();

    provider.setPostList(newsResponce, notify: false);
    provider.setPostAracIsList(newsResponce, notify: false);
    provider.setIsAracList(newsResponce, notify: false);
    provider.setAracSoforList(newsResponce, notify: false);
    provider.setSoforIsList(newsResponce, notify: false);
    provider.setOzelGunList(newsResponce, notify: false);
    provider.setFavoriteList(newsResponce, notify: false);

    provider.setisPostProcessing(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPostAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationWidget(),
        appBar: appBarWidget(
            context, 'Servisim', Icons.notifications, Colors.black),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ));
  }

  Widget bottomNavigationWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'Favorilerim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'İlan EKle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueGrey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
