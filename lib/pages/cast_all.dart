import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/pages/cast_single.dart';
import 'package:netflix/widgets/app_header.dart';

class CastAll extends StatefulWidget {
  final String text;

  final List cast;
  const CastAll({Key? key, required this.text, required this.cast})
      : super(key: key);

  @override
  _CastAllState createState() => _CastAllState();
}

class _CastAllState extends State<CastAll> {
  Color netflix_color = const Color(0xfff44336);
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
              padding: EdgeInsets.only(left: 0, right: 0),
              childAspectRatio: 1,
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 0,
              children: [
                for (var index = 0; index < widget.cast.length; index++)
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CastSingle(person: widget.cast[index])));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: DecorationImage(
                                    image: NetworkImage(widget.cast[index]
                                                ['profile_path'] !=
                                            null
                                        ? 'https://image.tmdb.org/t/p/w300/' +
                                            widget.cast[index]['profile_path']
                                        : 'https://www.gsplastics.ga/assets/images/notfound.png'),
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
                            ],
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 130, maxHeight: 100),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.cast[index]['name'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    widget.cast[index]['character'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w200),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
