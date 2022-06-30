// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, no_logic_in_create_state, unnecessary_this, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:fergie_time/classes/comp.dart';
import 'package:fergie_time/classes/match.dart';
import 'package:fergie_time/components/bottom_bar.dart';
import 'package:fergie_time/dir/dbhelper.dart';

class EditMatch extends StatefulWidget {
  final Match matches;
  EditMatch(this.matches);

  @override
  State<EditMatch> createState() => _EditMatchState(this.matches);
}

class _EditMatchState extends State<EditMatch> {
  Match matches;
  _EditMatchState(this.matches);

  TextEditingController opponent = TextEditingController();
  TextEditingController score_team = TextEditingController();
  TextEditingController score_opponent = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController event = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Match match;

    if (match != null) {
      event.text = match.event;
      opponent.text = match.opponent;
      score_team.text = match.score_team;
      score_opponent.text = match.score_opponent;
      date.text = match.date;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('C70101'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: Text('Edit Result ' + matches.event,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Stack(children: [
        Container(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text('Team'),
                subtitle: Text('Manchester United'),
              ),
              ListTile(
                leading: Icon(Icons.score),
                title: Text('Score Team'),
                subtitle: TextField(
                  keyboardType: TextInputType.number,
                  controller: score_team,
                  decoration: InputDecoration(
                    hintText: 'Score Team',
                  ),
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text('Opponent'),
                subtitle: TextField(
                  controller: opponent,
                  decoration: InputDecoration(
                    hintText: 'Opponent',
                  ),
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                leading: Icon(Icons.score),
                title: Text('Score Opponent'),
                subtitle: TextField(
                  keyboardType: TextInputType.number,
                  controller: score_opponent,
                  decoration: InputDecoration(
                    hintText: 'Score Opponent',
                  ),
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                leading: Icon(Icons.date_range_rounded),
                title: Text('Date'),
                subtitle: TextField(
                  keyboardType: TextInputType.datetime,
                  controller: date,
                  decoration: InputDecoration(
                    hintText: 'Date',
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: HexColor('C70101'),
                minimumSize: Size.fromHeight(50),
              ),
              child: Text(
                'Update Result',
              ),
              onPressed: () {
                setState(() {
                  match.event = event.text;
                  match.score_team = score_team.text;
                  match.score_opponent = score_opponent.text;
                  match.opponent = opponent.text;
                  match.date = date.text;
                });
                Navigator.pop(context, match);
              },
            ),
          ),
        )
      ]),
    );
  }
}

                    // dbHelper.insert(Match(
                    //   matches.name,
                    //   int.parse(score_team.text),
                    //   int.parse(score_opponent.text),
                    //   opponent.text,
                    //   date.text,
                    // ));
