import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/models/post.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/src/post_services.dart';

AppBar appBarWidget(
    BuildContext context, title, IconData icon, Color iconColor) {
  var provider = Provider.of<PostProvider>(context, listen: false);

  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    titleTextStyle: TextStyle(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: iconColor,
          ))
    ],
  );
}

AppBar appBarFavoriteWidget(BuildContext context, title, Post post) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    leading: BackButton(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    actions: [
      Consumer<PostProvider>(
          builder: (_, provider, __) => IconButton(
              onPressed: () {
                if (post.isFavorite == 1) {
                  provider.deleteFavoriteList(post);
                  PostServices().addFavorite(post.id);
                } else {
                  provider.addFavoriteList(post);
                  PostServices().addFavorite(post.id);
                }
              },
              icon: Icon(
                provider.isFavaroite(post.id)
                    ? Icons.star
                    : Icons.star_border_outlined,
                color: provider.isFavaroite(post.id)
                    ? Colors.yellow
                    : Colors.black,
              )))
    ],
  );
}
