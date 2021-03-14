import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movve_app/constant.dart';
import 'package:movve_app/screens/custom_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mov",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "ve",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: null,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                child: Text("Popular Movie", style: kHeadersLines),
              ),
              CustomList(3, images, names),
              Padding(
                padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                child: Text(
                  "Top Rated",
                  style: kHeadersLines,
                ),
              ),
              CustomList(3, images, names),
              Padding(
                padding: EdgeInsets.only(left: 22, top: 5, bottom: 7),
                child: Text(
                  "Upcoming",
                  style: kHeadersLines,
                ),
              ),
              CustomList(3, images, names),
            ],
          ),
        ),
      ),
    );
  }
}
