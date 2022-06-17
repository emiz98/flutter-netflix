import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:netflix/widgets/single_episode.dart';
import 'package:http/http.dart' as http;

class EpisodesPage extends StatefulWidget {
  final LinkedHashMap season_details;
  final int tv_show_id;

  const EpisodesPage(
      {Key? key, required this.season_details, required this.tv_show_id})
      : super(key: key);

  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  @override
  void initState() {
    load();
  }

  List episodes = [];
  bool loading = false;

  final String api_key = '2d993593c6f4bc11d6feb87b34548c0b';

  load() async {
    setState(() {
      loading = true;
    });
    String url =
        "https://api.themoviedb.org/3/tv/${widget.tv_show_id}?api_key=2d993593c6f4bc11d6feb87b34548c0b&append_to_response=season/${widget.season_details['season_number'].toString()}";

    final responseData = await http.get(Uri.parse(url));

    setState(() {
      var episodesDecode = json.decode(responseData.body);
      episodes = episodesDecode['season/' +
          widget.season_details['season_number'].toString()]['episodes'];
      // json.decode(responseData.body).forEach((key, value) {
      //   print('key is $key');
      // });
      print(widget.season_details);
      loading = episodes.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.white),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            if (!loading) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    AppHeader(layout: 3),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Season " +
                            widget.season_details['season_number'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var index = 0;
                                index < episodes.length;
                                index++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SingleEpisode(
                                  episode: episodes[index],
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                child: Center(
                    child: Lottie.asset("assets/images/netflix_loader.json")),
              );
            }
          })),
    );
  }
}
