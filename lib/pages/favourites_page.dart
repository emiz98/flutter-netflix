import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/widgets/app_header.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width.toDouble();
    var height = MediaQuery.of(context).size.height.toDouble();
    return DefaultTextStyle(
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white),
      ),
      child: Column(
        children: [
          AppHeader(layout: 1),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Favourites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  radius: 60,
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.white.withOpacity(0.4),
                    size: 80,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Looks Like You've Empty List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Download shows and movies so you'll never be withour something to watch even when you're offline",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size, 45),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        primary: Colors.white,
                      ),
                      onPressed: () => {},
                      icon: Icon(Icons.favorite, color: Colors.black),
                      label: Text("See What You Can Add",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
