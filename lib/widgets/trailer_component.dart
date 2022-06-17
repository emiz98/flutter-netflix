import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TrailerComp extends StatefulWidget {
  final String title;
  final String poster;
  final String titleImage;
  final List genres;

  const TrailerComp(
      {Key? key,
      required this.title,
      required this.poster,
      required this.titleImage,
      required this.genres})
      : super(key: key);

  @override
  _TrailerCompState createState() => _TrailerCompState();
}

class _TrailerCompState extends State<TrailerComp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 350,
      child: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/' + widget.poster),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(0)
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
          ),
          Positioned(
            top: 50,
            child: Container(
              width: size.width - 20,
              height: 150,
              child: Lottie.asset("assets/images/trailer.json"),
            ),
          ),
          Positioned.fill(
              top: 180,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300.0,
                  height: 200.0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: DefaultTextStyle(
                        style: GoogleFonts.bangers(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        child: Text(widget.title)),
                  ),
                ),
              )),
          Positioned.fill(
            top: 310,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.genres.length, (index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              widget.genres[index]['name'],
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
