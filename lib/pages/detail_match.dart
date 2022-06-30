// ignore_for_file: unused_import, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fergie_time/classes/comp.dart';
import 'package:fergie_time/components/bottom_bar.dart';
import 'package:fergie_time/pages/add_match.dart';
import 'package:fergie_time/pages/edit_match.dart';
import 'dart:async';
import 'package:fergie_time/dir/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fergie_time/classes/match.dart';
import "dart:math";

class DetailMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Starting> startingTeam1 = [
      Starting(num: '1', name: 'David de Gea', pos: 'GK'),
      Starting(num: '5', name: 'Harry Maguire', pos: 'DF'),
      Starting(num: '19', name: 'Raphael Varane', pos: 'DF'),
      Starting(num: '3', name: 'Luke Shaw', pos: 'DF'),
      Starting(num: '20', name: 'Diogo Dalot', pos: 'DF'),
      Starting(num: '6', name: 'Paul Pogba', pos: 'MF'),
      Starting(num: '17', name: 'Frederico', pos: 'MF'),
      Starting(num: '6', name: 'Juan Mata', pos: 'MF'),
      Starting(num: '18', name: 'Bruno Fernandes', pos: 'MF'),
      Starting(num: '10', name: 'Marcus Rashford', pos: 'FW'),
      Starting(num: '7', name: 'Cristiano Ronaldo', pos: 'FW'),
      Starting(num: '25', name: 'Jadon Sancho', pos: 'FW'),
    ];
    final List<Starting> startingTeam2 = [
      Starting(num: '1', name: 'Kepa Arrizabalaga', pos: 'GK'),
      Starting(num: '3', name: 'Marcos Alonso', pos: 'DF'),
      Starting(num: '4', name: 'Andreas Christensen', pos: 'DF'),
      Starting(num: '6', name: 'Thiago Silva', pos: 'DF'),
      Starting(num: '14', name: 'Trevor Chalobah', pos: 'DF'),
      Starting(num: '5', name: 'Jorginho', pos: 'MF'),
      Starting(num: '7', name: 'N’Golo Kante', pos: 'MF'),
      Starting(num: '8', name: 'Mateo Kovacic', pos: 'MF'),
      Starting(num: '22', name: 'Hakim Ziyech', pos: 'MF'),
      Starting(num: '9', name: 'Romelu Lukaku', pos: 'FW'),
      Starting(num: '11', name: 'Timo Werner', pos: 'FW'),
      Starting(num: '10', name: 'Christian Pulisic', pos: 'FW'),
    ];

    Match match = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('FF4646'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            child: Text('Manchester United VS ' + match.opponent,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Column(
          children: [
            // Container untuk tampilan sisi atas dan tengah
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  // color: HexColor('090303'),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(31, 179, 179, 179),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        20.0,
                        25.0,
                      ),
                    )
                  ]),
              // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // Tampilan evet pertandingan dan tanggal
                  Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor('FF4646'),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Text(
                            match.event,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            match.date,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Batas tampilan event dan tanggal pertandingan
                  // Tampilan logo dan skor
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(children: [
                            Image.asset(
                              'assets/images/logo/MU.png',
                              height: 60,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Manchester\n United',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Pogba (58')\n Fred (59')",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: HexColor('FF4646'),
                              border: Border.all(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              match.score_team + ' : ' + match.score_opponent,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(children: [
                            Image.asset(
                              'assets/images/logo/chelsea.png',
                              height: 60,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                match.opponent,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Lukaku (18')\n Havertz (69')\n Kante (80')",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                  //Batas tampilan logo dan skor
                ],
              ),
            ),
            // Batas untuk tampilan sisi atas dan tengah
            // Tampilan tulisan LineUp
            Container(
              padding: const EdgeInsets.all(5),
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 69, 56),
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              child: Text(
                'Line Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            // Batas tampilan tulisan LineUp
            // Tampilan isi LineUp antar kedua tim
            Container(
              padding:
                  const EdgeInsets.only(bottom: 15, top: 5, left: 5, right: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: HexColor('FF4646'),
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              // Tab Controller berisi tab bar untuk navbar nama tim
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        labelColor: Color.fromARGB(255, 212, 240, 3),
                        labelStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        unselectedLabelColor:
                            Color.fromARGB(255, 255, 255, 255),
                        unselectedLabelStyle: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Color.fromARGB(255, 255, 255, 255),
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              "Manchester United",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                            child: Text("Chelsea"),
                          ),
                          // Tab(
                          //   child: Text("Orthers"),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 0, top: 13, left: 0, right: 0),
                        height: 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 198, 194),
                          border: Border.all(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 0, top: 15, left: 5, right: 5),
                        height: 233,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 69, 56),
                          border: Border.all(
                            color: Colors.red,
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            lineUpTeam1(startingTeam1: startingTeam1),
                            lineUpTeam2(startingTeam2: startingTeam2),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            // Batas isi dari LineUp
          ],
        ));
  }
}

class Starting {
  String num, name, pos;

  Starting({this.num, this.name, this.pos});
}

// Widget untuk lineUp tim 1
class lineUpTeam1 extends StatelessWidget {
  const lineUpTeam1({
    Key key,
    @required this.startingTeam1,
  }) : super(key: key);

  final List<Starting> startingTeam1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: startingTeam1.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      startingTeam1[index].num,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      // Menampilkan teks agar tidak lebih dari 12 karakter
                      startingTeam1[index].name.length > 12
                          ? startingTeam1[index].name.substring(0, 12) + '..'
                          : startingTeam1[index].name,
                      // startingTeam1[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // strutStyle: StrutStyle(fontSize: 12.0),
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      startingTeam1[index].pos,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget untuk lineUp tim 2
class lineUpTeam2 extends StatelessWidget {
  const lineUpTeam2({
    Key key,
    @required this.startingTeam2,
  }) : super(key: key);

  final List<Starting> startingTeam2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: startingTeam2.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      startingTeam2[index].num,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        // Menampilkan teks agar tidak lebih dari 12 karakter
                        startingTeam2[index].name.length > 12
                            ? startingTeam2[index].name.substring(0, 12) + '..'
                            : startingTeam2[index].name,
                        // startingTeam2[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      startingTeam2[index].pos,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
