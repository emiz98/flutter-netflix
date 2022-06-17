import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/pages/genre_page.dart';
import 'package:tmdb_api/tmdb_api.dart';

class GenreWidget extends StatefulWidget {
  const GenreWidget({Key? key}) : super(key: key);

  @override
  _GenreWidgetState createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  void initState() {
    loadMovies();
  }

  List genres = [];
  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map genreResult = await tmdbWithCustomLogs.v3.geners.getMovieList();

    setState(() {
      genres = genreResult['genres'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(genres.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GenrePage(
                            genre_id: genres[index]['id'],
                            genre_name: genres[index]['name'])),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.23),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Text(genres[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
