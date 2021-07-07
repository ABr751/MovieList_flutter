import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  MovieTile(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(top:12,left: 12,right: 12),
      color: Theme.of(context).backgroundColor,
      child: Column(children: [
        Expanded(
            child: FadeInImage(
                placeholder: AssetImage(
                    "assets/images/placeholder_for_missing_posters.png"),
                image: AssetImage("assets/images/" + movie.poster),fit: BoxFit.cover,)),
        Container(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            movie.name,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
