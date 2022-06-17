import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/pages/episodes_page.dart';

class TVWidget extends StatefulWidget {
  final List seasons;
  final int tv_show_id;
  const TVWidget({Key? key, required this.seasons, required this.tv_show_id})
      : super(key: key);

  @override
  _TVWidgetState createState() => _TVWidgetState();
}

class _TVWidgetState extends State<TVWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.seasons.length > 0)
          Container(
            height: 5,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
          ),
        if (widget.seasons.length > 0)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Seasons",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: List.generate(widget.seasons.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EpisodesPage(
                                  season_details: widget.seasons[index],
                                  tv_show_id: widget.tv_show_id,
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
                                    image: NetworkImage(widget.seasons[index]
                                                ['poster_path'] !=
                                            null
                                        ? 'https://image.tmdb.org/t/p/w300/' +
                                            widget.seasons[index]['poster_path']
                                        : "https://www.gsplastics.ga/assets/images/notfound.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 110,
                            height: 160,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0)
                                    ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 25,
                              child: Text(
                                widget.seasons[index]['name'],
                              ))
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
