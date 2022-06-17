import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/pages/movie_single.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:tmdb_api/tmdb_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    searchController.addListener(() {});
  }

  final searchController = TextEditingController();

  List searchedMovies = [];
  List searchedTVShows = [];
  bool loading = false;

  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDk5MzU5M2M2ZjRiYzExZDZmZWI4N2IzNDU0OGMwYiIsInN1YiI6IjYxMmUyYmU4ZmFjNTAyMDA4ZGFiZmEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VT4Y-HkAuqCfCFMyKK_-MTHFjM0LVJCUe9faWoxCnYo';

  loadMovies(String query) async {
    setState(() {
      loading = true;
    });
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map movieResult = await tmdbWithCustomLogs.v3.search.queryMovies(query);
    Map showResult = await tmdbWithCustomLogs.v3.search.queryTvShows(query);

    setState(() {
      searchedMovies = movieResult['results'];
      searchedTVShows = showResult['results'];
      loading = searchedMovies.isEmpty && searchedTVShows.isEmpty;
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
    return DefaultTextStyle(
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.white),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppHeader(layout: 1),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: searchController,
                onChanged: (text) {
                  Future.delayed(const Duration(seconds: 3), () {
                    loadMovies(text);
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  suffixIcon: searchController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () => searchController.clear(),
                        ),
                  hintText: "Search Text",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Search results for" + " " + searchController.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(left: 10, right: 10),
                childAspectRatio: 110 / 160,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: [
                  for (var index = 0; index < searchedMovies.length; index++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieSingle(movie: searchedMovies[index])),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(searchedMovies[index]
                                            ['poster_path'] !=
                                        null
                                    ? 'https://image.tmdb.org/t/p/w300/' +
                                        searchedMovies[index]['poster_path']
                                    : 'https://www.gsplastics.ga/assets/images/notfound.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  for (var index = 0; index < searchedTVShows.length; index++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieSingle(movie: searchedTVShows[index])),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(searchedTVShows[index]
                                            ['poster_path'] !=
                                        null
                                    ? 'https://image.tmdb.org/t/p/w300/' +
                                        searchedTVShows[index]['poster_path']
                                    : 'https://www.gsplastics.ga/assets/images/notfound.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
    ;
  }
}
