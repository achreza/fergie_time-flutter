// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, no_logic_in_create_state, unnecessary_this, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, prefer_collection_literals, deprecated_member_use, can_be_null_after_null_aware, missing_return

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fergie_time/classes/comp.dart';
import 'package:fergie_time/components/bottom_bar.dart';
import 'package:fergie_time/pages/add_match.dart';
import 'package:fergie_time/pages/edit_match.dart';
import 'package:fergie_time/services/matches.dart';
import 'dart:async';
import 'package:fergie_time/dir/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fergie_time/classes/match.dart';

class CompetitionPage extends StatefulWidget {
  final Comp comps;
  CompetitionPage(this.comps);

  @override
  State<CompetitionPage> createState() => _CompetitionPageState(this.comps);
}

class _CompetitionPageState extends State<CompetitionPage> {
  Comp comps;
  _CompetitionPageState(this.comps);

  List match;
  Matches service;
  int counting;

  Future initialize() async {
    match = [];
    match = await service.getMatches(comps.idComp);
    setState(() {
      counting = match.length;
      match = match;
    });
  }

  @override
  void initState() {
    service = Matches();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: HexColor('C70101'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: Text(comps.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: createListView()),
        ],
      ),
    );
  }

  FutureBuilder createListView() {
    TextStyle textStyle = Theme.of(context)?.textTheme.headline5;
    return FutureBuilder(
        future: service.getMatches(comps.idComp),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: (this.counting == null) ? 0 : this.counting,
              itemBuilder: (context, int index) {
                return InkWell(
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/matches',
                  //       arguments: snapshot.data[index]);
                  // },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.all(10),
                    elevation: 2.0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 7),
                                  child: Text(
                                    match[index].round,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    match[index].teamName,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 2,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          NetworkImage(match[index].teamLogo),
                                    )),
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          match[index].goalsHome.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: match[index].goalsAway <
                                                    match[index].goalsHome
                                                ? Colors.green.shade800
                                                : Colors.red,
                                          ),
                                        ),
                                      ),
                                      SafeArea(child: Text('  -  ')),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          match[index].goalsAway.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: match[index].goalsAway >
                                                    match[index].goalsHome
                                                ? Colors.green.shade800
                                                : Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                    flex: 2,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          NetworkImage(match[index].oppLogo),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    match[index].teamOpp,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

/* 
  
  // Future<Match> navigateToAddMatch(context, Comp comps) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddMatch(comps)),
  //   );
  //   return result;
  // }

  // Future<Match> navigateToEditMatch(context, Match matches) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => EditMatch(matches)),
  //   );
  //   return result;
  // }
*/