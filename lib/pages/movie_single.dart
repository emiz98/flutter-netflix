import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:netflix/widgets/movie_slider.dart';
import 'package:netflix/widgets/rounded_slider.dart';
import 'package:netflix/widgets/trailer_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/widgets/tv_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieSingle extends StatefulWidget {
  final LinkedHashMap movie;

  const MovieSingle({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieSingleState createState() => _MovieSingleState();
}

class _MovieSingleState extends State<MovieSingle> {
  @override
  void initState() {
    delay();
    load();
  }

  Color netflix_color = const Color(0xfff44336);
  List relatedMovies = [];
  List relatedTVShows = [];
  List relatedCast = [];
  List relatedSeasons = [];
  List genres = [];

  bool loading = true;

  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  load() async {
    // if (allLoaded) {
    //   return;
    // }
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map relatedResult =
        await tmdbWithCustomLogs.v3.movies.getSimilar(widget.movie['id']);

    Map relatedResult2 =
        await tmdbWithCustomLogs.v3.tv.getSimilar(widget.movie['id']);
    Map relatedCastResults;
    Map genresResults;

    if (widget.movie['title'] != null) {
      relatedCastResults =
          await tmdbWithCustomLogs.v3.movies.getCredits(widget.movie['id']);
      genresResults =
          await tmdbWithCustomLogs.v3.movies.getDetails(widget.movie['id']);
    } else {
      relatedCastResults =
          await tmdbWithCustomLogs.v3.tv.getCredits(widget.movie['id']);
      genresResults =
          await tmdbWithCustomLogs.v3.tv.getDetails(widget.movie['id']);
    }

    setState(() {
      relatedMovies = relatedResult['results'];
      if (relatedResult2['results'] != null) {
        relatedTVShows = relatedResult2['results'];
        if (widget.movie['title'] == null) {
          relatedSeasons = genresResults['seasons'];
        }
      }
      relatedCast = relatedCastResults['cast'];
      genres = genresResults['genres'];
      // loading = relatedCast.isEmpty && genres.isEmpty;
      // allLoaded = relatedCast.isEmpty;
    });
  }

  delay() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width.toDouble();
    int ratings = (widget.movie['vote_average'] / 2).round();

    return DefaultTextStyle(
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        if (!loading) {
          return Column(
            children: [
              Stack(
                children: [
                  TrailerComp(
                    title: widget.movie['title'] != null
                        ? widget.movie['title']
                        : widget.movie['name'],
                    poster: widget.movie['poster_path'],
                    genres: genres,
                    titleImage:
                        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a58a7719-0dcf-4e0b-b7bb-d2b725dbbb8e/deiulh2-e958d335-e034-4117-8cdb-329a9a4e8562.png/v1/fill/w_1430,h_556,strp/spider_man_no_way_home___logo_png_oficial_2021_by_andrewvm_deiulh2-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTU2IiwicGF0aCI6IlwvZlwvYTU4YTc3MTktMGRjZi00ZTBiLWI3YmItZDJiNzI1ZGJiYjhlXC9kZWl1bGgyLWU5NThkMzM1LWUwMzQtNDExNy04Y2RiLTMyOWE5YTRlODU2Mi5wbmciLCJ3aWR0aCI6Ijw9MTQzMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.wLc9rO5SeHn-fjYrQMTMboZEgBvWEi8jmLfIKL0wrEY",
                  ),
                  AppHeader(layout: 2),
                ],
              ),

              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.movie['title'] != null
                              ? widget.movie['title']
                              : widget.movie['name'] +
                                  widget.movie['id'].toString(),
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: netflix_color,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(widget.movie['vote_count'].toString())
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ratings"),
                                Row(
                                  children: List.generate(ratings, (index) {
                                    return GestureDetector(
                                      child: Stack(
                                        children: [
                                          Icon(Icons.star_border_outlined,
                                              color: netflix_color),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(size, 45),
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              primary: Colors.white,
                            ),
                            onPressed: () => {},
                            icon: Icon(Icons.play_arrow, color: Colors.black),
                            label: Text("Play",
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(size, 45),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              primary: Colors.white.withOpacity(0.1),
                            ),
                            onPressed: () => {},
                            icon: Icon(Icons.download),
                            label: Text(
                              "Download",
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.movie['overview'],
                          )
                        ],
                      ),
                    ),
                    RoundedSlider(
                      text: "Cast",
                      cast: relatedCast,
                    ),
                    TVWidget(
                        seasons: relatedSeasons,
                        tv_show_id: widget.movie['id']),
                    MovieSlider(
                        text: "Related Movies",
                        movies: relatedMovies != null ? relatedMovies : []),
                    MovieSlider(
                        text: "Related TV Shows",
                        movies: relatedTVShows != null ? relatedTVShows : []),
                  ],
                ),
              ))

              //cast
              //videos
            ],
          );
        } else {
          return Container(
            child: Center(
                child: Lottie.asset("assets/images/netflix_loader.json")),
          );
        }
      }),
    );
  }
}
