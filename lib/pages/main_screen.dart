import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/pages/root_app.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    delay();
  }

  bool loading = true;
  delay() {
    Future.delayed(const Duration(milliseconds: 4500), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget getBody() {
    const netflix_color = const Color(0xfff44336);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(60),
      child: DefaultTextStyle(
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.white),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            if (!loading) {
              return Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 45),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            primary: netflix_color),
                        child: Text("Sign Up with Email"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RootApp()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(300, 45),
                              side: BorderSide(width: 2, color: netflix_color),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                              primary: Colors.white,
                            ),
                            onPressed: () => {},
                            icon: Image.asset(
                              'assets/images/google.png',
                              width: 20,
                            ),
                            label: Text(
                              "Sign Up with Google",
                            ))),
                    SizedBox(
                      height: 120,
                    ),
                    Text(
                      "Already have an account? Sign in",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                height: size.height,
                width: size.width,
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Lottie.asset("assets/images/netflix_loader.json"),
                    Column(
                      children: [
                        SizedBox(
                          height: 140,
                        ),
                        Text("Powered by",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child:
                                  Image.asset('assets/images/flutter_logo.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/tmdb_logo.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child:
                                  Image.asset('assets/images/netflix_logo.png'),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
              );
            }
          })),
    );
  }
}
