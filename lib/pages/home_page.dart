import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:netflix/widgets/genre_widget.dart';
import 'package:netflix/widgets/movie_slider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadMovies();
  }

  List trendingMovies = [];
  List netflixMovies = [];
  List popularMovies = [];
  List genres = [
    "Action",
    "Adventure",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Kids",
    "Mystery",
    "Reality",
    "Sci-Fi",
    "Fantasy",
  ];

  bool loading = false;
  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  loadMovies() async {
    setState(() {
      loading = true;
    });
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map netflixResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPouplar();

    setState(() {
      trendingMovies = trendingResult['results'];
      netflixMovies = netflixResult['results'];
      popularMovies = popularResult['results'];

      loading = trendingMovies.isEmpty &&
          netflixMovies.isEmpty &&
          popularMovies.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        AppHeader(layout: 1),
        GenreWidget(),
        Expanded(
          child: SingleChildScrollView(
              child: LayoutBuilder(builder: (context, constraints) {
            if (!loading) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieSlider(text: "Now Playing", movies: netflixMovies),
                  MovieSlider(text: "Trending", movies: trendingMovies),
                  MovieSlider(
                      text: "Popular on Netflix", movies: popularMovies),
                ],
              );
            } else {
              return Container(
                height: 500,
                child: Center(
                    child: Lottie.asset("assets/images/netflix_loader.json")),
              );
            }
          })),
        ),
      ],
    );
  }
}
