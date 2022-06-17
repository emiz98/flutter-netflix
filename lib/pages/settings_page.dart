import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/pages/main_screen.dart';
import 'package:netflix/widgets/app_header.dart';
import 'package:netflix/widgets/single_setting.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List icons = [
    'https://ih1.redbubble.net/image.618405117.2432/flat,1000x1000,075,f.u2.jpg',
    'https://pbs.twimg.com/media/DmBraqkXcAA1Yco.jpg',
    'https://i.pinimg.com/originals/bd/ee/4c/bdee4c328550aaf21aa9f43fd19e2136.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.white),
          ),
          child: Container(
            child: Column(
              children: [
                AppHeader(layout: 3),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Switch Accounts",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Icon(Icons.edit, color: Colors.white),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Manage Profiles",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var index = 0; index < 3; index++)
                            Container(
                              child: Image.network(
                                icons[index],
                                height: 85,
                                width: 85,
                              ),
                            ),
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0), //or 15.0
                              child: Container(
                                height: 85,
                                width: 85,
                                color: Colors.white.withOpacity(0.2),
                                child: Icon(Icons.add,
                                    color: Colors.white.withOpacity(0.6),
                                    size: 50.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Privacy",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleSetting(
                                icon: Icon(Icons.lock_outline),
                                title: "Private Profile",
                                desc:
                                    "Only people who follows you can see your activities"),
                            SingleSetting(
                                icon: Icon(Icons.contacts_outlined),
                                title: "Contacts Access",
                                desc:
                                    "People who have your phone number can find your Netflix profile"),
                            SingleSetting(
                                icon: Icon(Icons.block_outlined),
                                title: "Blocked Profiles",
                                desc:
                                    "People you block won't be able to find your Netflix profile"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "More Information",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleSetting(
                                icon: Icon(Icons.file_copy_outlined),
                                title: "Privacy Policy",
                                desc: ""),
                            SingleSetting(
                                icon: Icon(Icons.help_outline),
                                title: "Help Center",
                                desc: ""),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
                            child: Text("Sign Out",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("Version 13.38.0 (Build 36124) 5.0.1-003",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
