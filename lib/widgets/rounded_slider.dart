import 'package:flutter/material.dart';
import 'package:netflix/pages/cast_all.dart';
import 'package:netflix/pages/cast_single.dart';

class RoundedSlider extends StatefulWidget {
  final String text;

  final List cast;
  const RoundedSlider({Key? key, required this.text, required this.cast})
      : super(key: key);

  @override
  _RoundedSliderState createState() => _RoundedSliderState();
}

class _RoundedSliderState extends State<RoundedSlider> {
  @override
  Widget build(BuildContext context) {
    Color netflix_color = const Color(0xfff44336);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.cast.length > 0)
            SizedBox(
              height: 30,
            ),
          if (widget.cast.length > 0)
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
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
                              builder: (context) => CastAll(
                                  text: "Related Cast", cast: widget.cast)),
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
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                children: List.generate(
                    widget.cast.length > 8 ? 8 : widget.cast.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CastSingle(person: widget.cast[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
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
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: 100, maxHeight: 70),
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
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
