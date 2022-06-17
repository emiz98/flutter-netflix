import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:netflix/widgets/movie_slider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class CastSingle extends StatefulWidget {
  final LinkedHashMap person;

  const CastSingle({Key? key, required this.person}) : super(key: key);

  @override
  _CastSingleState createState() => _CastSingleState();
}

class _CastSingleState extends State<CastSingle> {
  @override
  void initState() {
    load();
  }

  Color netflix_color = const Color(0xfff44336);
  List castMovies = [];
  List castSeries = [];

  bool loading = false;
  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  load() async {
    setState(() {
      loading = true;
    });
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map castMoviesResults =
        await tmdbWithCustomLogs.v3.people.getMovieCredits(widget.person['id']);
    Map castSeriesResults =
        await tmdbWithCustomLogs.v3.people.getTvCredits(widget.person['id']);
    setState(() {
      castMovies = castMoviesResults['cast'];
      castSeries = castSeriesResults['cast'];
      loading = castMovies.isEmpty && castSeries.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTextStyle(
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.white),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (!loading) {
                  return Column(
                    children: [
                      AppHeader(
                        layout: 3,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w300/' +
                                        widget.person['profile_path']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: netflix_color,
                                width: 3.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.person['name'] +
                                " " +
                                widget.person['id'].toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "56",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text("Followings",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "56154",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text("Popularity",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                              Column(
                                children: [
                                  Text("30M",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800)),
                                  Text("Followers",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MovieSlider(
                                text: "Related Movies", movies: castMovies),
                            MovieSlider(
                                text: "Related TV Shows", movies: castSeries)
                          ],
                        ),
                      ))
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                        child:
                            Lottie.asset("assets/images/netflix_loader.json")),
                  );
                }
              },
            )));
  }
}
