import 'package:flutter/material.dart';
import 'package:serviscim_app/models/post.dart';

class PostProvider extends ChangeNotifier {
  bool _isPostProcessing = true;
  List<Post> _postList = [];
  List<Post> _postAracIsList = [];
  List<Post> _isAracList = [];
  List<Post> _aracSoforList = [];
  List<Post> _isSoforList = [];
  List<Post> _ozelGunList = [];
  List<Post> _favoriteList = [];

  bool get isPostProcessing => _isPostProcessing;
  setisPostProcessing(bool value) {
    _isPostProcessing = value;
    notifyListeners();
  }

  List<Post> get postList => _postList;
  setPostList(List<Post> list, {bool notify = true}) {
    _postList = list;
    if (notify) notifyListeners();
  }

  Post getPostsByIndex(int index) => _postList[index];
  int get postListLenght => _postList.length;

  //Arac Is Listesi
  List<Post> get postAracIsList => _postAracIsList;
  setPostAracIsList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.postTipId == 1) {
        _temp.add(element);
      }
    });
    _postAracIsList = _temp;
    if (notify) notifyListeners();
  }

  Post getPostsAracIsByIndex(int index) => _postAracIsList[index];
  int get postAracIsListLenght => _postAracIsList.length;
  //

  //Is Arac Listesi
  List<Post> get isAracList => _isAracList;
  setIsAracList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.postTipId == 2) {
        _temp.add(element);
      }
    });
    _isAracList = _temp;
    if (notify) notifyListeners();
  }

  Post getIsAracByIndex(int index) => _isAracList[index];
  int get postIsAracListLenght => _isAracList.length;
  //

  //Arac Sofor Listesi
  List<Post> get aracSoforList => _aracSoforList;
  setAracSoforList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.postTipId == 3) {
        _temp.add(element);
      }
    });
    _aracSoforList = _temp;
    if (notify) notifyListeners();
  }

  Post getAracSoforByIndex(int index) => _aracSoforList[index];
  int get postAracSoforListLenght => _aracSoforList.length;
  //

  //Sofor Is Listesi
  List<Post> get soforIsList => _isSoforList;
  setSoforIsList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.postTipId == 4) {
        _temp.add(element);
      }
    });
    _isSoforList = _temp;
    if (notify) notifyListeners();
  }

  Post getSoforIsByIndex(int index) => _isSoforList[index];
  int get postSoforIsListLenght => _isSoforList.length;
  //

  //Ozel Gun Listesi
  List<Post> get ozelGunList => _ozelGunList;
  setOzelGunList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.postTipId == 5) {
        _temp.add(element);
      }
    });
    _ozelGunList = _temp;
    if (notify) notifyListeners();
  }

  Post getOzelGunByIndex(int index) => _ozelGunList[index];
  int get postOzelGunListLenght => _ozelGunList.length;
  //

  //get user favorite
  List<Post> get favoriteList => _favoriteList;
  setFavoriteList(List<Post> list, {bool notify = true}) {
    List<Post> _temp = [];
    list.forEach((element) {
      if (element.isFavorite == 1) {
        _temp.add(element);
      }
    });

    _favoriteList = _temp;
    if (notify) notifyListeners();
  }

  Post getFavoriteByIndex(int index) => _favoriteList[index];
  int get postFavoriteListLenght => _favoriteList.length;
  //

  bool isFavaroite(int id) {
    return _favoriteList.any((e) => e.id == id) ? true : false;
  }

  addFavoriteList(Post post) {
    _favoriteList.add(post);
    post.isFavorite = 1;
    notifyListeners();
  }

  deleteFavoriteList(Post post) {
    _favoriteList.removeWhere((element) => element.id == post.id);
    post.isFavorite = 0;
    notifyListeners();
  }
}
