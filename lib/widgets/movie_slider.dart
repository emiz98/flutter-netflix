import 'package:flutter/material.dart';
import 'package:netflix/pages/movie_single.dart';
import 'package:netflix/widgets/view_all.dart';

class MovieSlider extends StatelessWidget {
  final String text;
  final List movies;

  const MovieSlider({Key? key, required this.text, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movies.length > 0)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewAll(text: text, movies: movies)),
                      );
                    },
                    icon: Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                    label: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ))
              ],
            ),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children:
                  List.generate(movies.length > 8 ? 8 : movies.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieSingle(
                              movie: movies[index],
                            )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(movies[index]
                                            ['poster_path'] !=
                                        null
                                    ? 'https://image.tmdb.org/t/p/w300/' +
                                        movies[index]['poster_path']
                                    : "https://www.gsplastics.ga/assets/images/notfound.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
