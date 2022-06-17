import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSetting extends StatefulWidget {
  final String title;
  final String desc;
  final Icon icon;

  const SingleSetting(
      {Key? key, required this.icon, required this.title, required this.desc})
      : super(key: key);

  @override
  _SingleSettingState createState() => _SingleSettingState();
}

class _SingleSettingState extends State<SingleSetting> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.07)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon.icon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
