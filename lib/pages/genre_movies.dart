import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/widgets/view_all.dart';

class GenreMovies extends StatefulWidget {
  const GenreMovies({Key? key}) : super(key: key);

  @override
  _GenreMoviesState createState() => _GenreMoviesState();
}

class _GenreMoviesState extends State<GenreMovies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.white),
        ),
        child: Column(
          children: [ViewAll(text: "Sci-Fi", movies: [])],
        ),
      ),
    );
  }
}
