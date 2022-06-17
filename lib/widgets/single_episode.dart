import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SingleEpisode extends StatefulWidget {
  final LinkedHashMap episode;
  const SingleEpisode({Key? key, required this.episode}) : super(key: key);

  @override
  _SingleEpisodeState createState() => _SingleEpisodeState();
}

class _SingleEpisodeState extends State<SingleEpisode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.episode['still_path'] != null
                      ? 'https://image.tmdb.org/t/p/w300/' +
                          widget.episode['still_path']
                      : "https://www.gsplastics.ga/assets/images/notfound.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6)),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 150,
              child: Text(
                widget.episode['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Text(
              widget.episode['air_date'],
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.7)),
            ),
            SizedBox(
              height: 5,
            ),
            if (widget.episode['overview'].length > 0)
              Container(
                width: 180,
                child: Text(
                  widget.episode['overview'].length > 85
                      ? widget.episode['overview'].substring(0, 80) + " ..."
                      : widget.episode['overview'],
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
              ),
          ]),
          Container(
              width: 50,
              height: 50,
              child: Lottie.asset('assets/images/download.json'))
        ],
      ),
    );
  }
}
