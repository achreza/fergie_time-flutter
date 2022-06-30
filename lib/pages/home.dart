// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fergie_time/models/club.dart';
import 'package:fergie_time/models/comp.dart';
import 'package:fergie_time/classes/comp.dart';
import 'package:fergie_time/pages/competition.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List<dynamic> comps = [
    Comp(logo: 'UCL.png', name: 'UCL', idComp: '2'),
    Comp(logo: 'EPL.png', name: 'Premier League', idComp: '39'),
    Comp(logo: 'FA Cup.png', name: 'FA Cup', idComp: '45'),
    Comp(logo: 'Carabao.png', name: 'Carabao Cup', idComp: '48'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nama dan Logo Aplikasi
      appBar: AppBar(
        backgroundColor: HexColor('C70101'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'FERGIE TIME  ',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white),
              ),
            ),
            Container(
                width: 45,
                height: 45,
                child: Image.asset('assets/images/logo/AppLogo.png')),
          ],
        ),
        elevation: 0,
      ),

      body: Container(
        child: ListView(
          // Gambar Swiper Otomatis
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 13),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: club.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(club[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  // Posisi Gambar Swiper Dalam Bentuk Lingkaran
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      club,
                      (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6.5,
                          width: 6.5,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? HexColor('C70101')
                                  : Color.fromARGB(255, 207, 207, 207)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Last Home Match Judul
            Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 15),
              child: Text(
                'LAST HOME MATCH',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: HexColor('C70101'),
                    fontSize: 20),
              ),
            ),

            // Last Home Match
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              color: Color.fromARGB(255, 209, 209, 209),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Text(
                      'Premier League',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Text(
                      'MatchDay 32',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor('C70101'),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icon/MU.png',
                                fit: BoxFit.cover,
                                width: 75,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Manchester\n United',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '3 : 2',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icon/Norwich.png',
                                fit: BoxFit.cover,
                                width: 75,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Norwich\n City',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Competitions Judul
            Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 15),
              child: Text(
                'COMPETITIONS',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: HexColor('C70101'),
                    fontSize: 20),
              ),
            ),

            // Competitions
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: comp.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Fungsi Klik
                    child: GestureDetector(
                      onTap: () async {
                        // ignore: unused_local_variable
                        var comp = await navigateToCompetition(
                            context, this.comps[index]);
                      },
                      //splashColor: Color.fromARGB(255, 195, 195, 195),
                      child: Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromARGB(255, 216, 216, 216),
                              width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(comp[index].logo, height: 70),
                              Text(comp[index].name,
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Comp> navigateToCompetition(context, Comp comps) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompetitionPage(comps),
      ),
    );
    return result;
  }
}
