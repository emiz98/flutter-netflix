import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/pages/movie_single.dart';
import 'package:netflix/widgets/app_header.dart';

class ViewAll extends StatefulWidget {
  final String text;
  final List movies;

  const ViewAll({Key? key, required this.text, required this.movies})
      : super(key: key);

  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          AppHeader(layout: 3),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.text,
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
                for (var index = 0; index < widget.movies.length; index++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieSingle(movie: widget.movies[index])),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      width: 110,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.movies[index]
                                          ['poster_path'] !=
                                      null
                                  ? 'https://image.tmdb.org/t/p/w300/' +
                                      widget.movies[index]['poster_path']
                                  : 'https://www.gsplastics.ga/assets/images/notfound.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
