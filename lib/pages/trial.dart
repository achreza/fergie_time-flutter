// ignore_for_file: annotate_overrides, prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:fergie_time/services/matches.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class Trial extends StatefulWidget {
  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  // String result = "";
  List match;
  Matches service;
  int counting;

  Future initialize() async {
    match = [];
    match = await service.getMatches('2');
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

  Widget build(BuildContext context) {
    // services.getMatches().then((value) {
    //   setState(() {
    //     result = value;
    //   });
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text("Trial"),
      ),
      body: ListView.builder(
        // ignore: unnecessary_this
        itemCount: (this.counting == null) ? 0 : this.counting,
        itemBuilder: (context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(match[position].teamLogo),
                ),
                title: Text(match[position].teamName),
                subtitle: Text(
                  'Score : ' +
                      match[position].goalsHome.toString() +
                      ' - ' +
                      match[position].goalsAway.toString(),
                ),
                trailing: Text(match[position].teamOpp),
                onTap: () {
                  // MaterialPageRoute route = MaterialPageRoute(
                  //   builder: (_) => MovieDetail(movies[position]),
                  // );
                  // Navigator.push(context, route);
                },
              ));
        },
      ),
    );
  }
}


/* 
  FutureBuilder(
        future: service.getMatches(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              // ignore: unnecessary_this
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int position) {
                return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(match[position].teamLogo),
                      ),
                      title: Text(match[position].teamOpp),
                      subtitle: Text(
                        'Score : ' +
                            match[position].goalsHome.toString() +
                            ' - ' +
                            match[position].goalsAway.toString(),
                      ),
                      onTap: () {},
                    ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
  } ListView.builder(
          // ignore: unnecessary_this
          itemCount: (this.counting == null) ? 0 : this.counting,
          itemBuilder: (context, int position) {
            return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(match[position].teamLogo),
                  ),
                  title: Text(match[position].teamOpp),
                  subtitle: Text(
                    'Score : ' +
                        match[position].goalsHome.toString() +
                        ' - ' +
                        match[position].goalsAway.toString(),
                  ),
                  onTap: () {
                    // MaterialPageRoute route = MaterialPageRoute(
                    //   builder: (_) => MovieDetail(movies[position]),
                    // );
                    // Navigator.push(context, route);
                  },
                ));
          },
        ),
*/
