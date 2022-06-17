import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/view_all.dart';
import 'package:tmdb_api/tmdb_api.dart';

class GenrePage extends StatefulWidget {
  final int genre_id;
  final String genre_name;

  const GenrePage({Key? key, required this.genre_id, required this.genre_name})
      : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    loadMovies();
  }

  bool loading = false;
  List genres = [];
  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  loadMovies() async {
    setState(() {
      loading = true;
    });
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map genreResult = await tmdbWithCustomLogs.v3.discover
        .getMovies(withGenres: widget.genre_id.toString());

    setState(() {
      genres = genreResult['results'];
      loading = genres.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (!loading) {
        return Container(
          child: ViewAll(text: widget.genre_name, movies: genres),
        );
      } else {
        return Container(
          child:
              Center(child: Lottie.asset("assets/images/netflix_loader.json")),
        );
        ;
      }
    });
  }
}
