import 'package:flutter/material.dart';
import 'package:netflix/pages/root_app.dart';
import 'package:netflix/pages/search_page.dart';
import 'package:netflix/pages/settings_page.dart';

class AppHeader extends StatefulWidget {
  final int layout;
  const AppHeader({Key? key, required this.layout}) : super(key: key);

  @override
  _AppHeaderState createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.layout != 1)
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
            ),
          if (widget.layout != 2)
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootApp()),
                  );
                },
                child: Image.asset("assets/images/logo.png", scale: 10)),
          if (widget.layout != 2)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                if (widget.layout == 1)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/originals/bd/ee/4c/bdee4c328550aaf21aa9f43fd19e2136.png"),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://external-preview.redd.it/n_AtInhsMt0qhCrMiPCK0lDokMO7MdQdIBi4t5pyYT0.jpg?auto=webp&s=64e8b4ea973102d57f6f56e09eef5aa48cc1cb49"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            )
        ],
      ),
    );
  }
}
