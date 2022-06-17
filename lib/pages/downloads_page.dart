import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/widgets/app_header.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width.toDouble();
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
                "Downloads",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Smart Downloads",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("ON",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold))
                ],
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
                    Icons.download,
                    color: Colors.white.withOpacity(0.4),
                    size: 80,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Never be without Netflix",
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
                  padding: const EdgeInsets.only(left: 15, right: 15),
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
                      icon: Icon(Icons.download, color: Colors.black),
                      label: Text("See What You Can Download",
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
