// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';
import 'dart:io';
// import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fergie_time/models/lineup.dart';

class LineupMatch {
  static const headers = {
    'x-apisports-key': '',
    'x-apisports-host': 'v3.football.api-sports.io'
  };
  List lineup;

  final request = http.Request(
      'GET',
      Uri.parse(
          'https://v3.football.api-sports.io/fixtures/lineups?fixture=710561'));

  Future<List> getLineup() async {
    request.headers.addAll(headers);
    http.StreamedResponse result = await request.send();

    if (result.statusCode == HttpStatus.ok) {
      final response = await result.stream.bytesToString();
      final jsonResponse = json.decode(response);
      final lineupMap = jsonResponse['response'];
      final List<dynamic> starting = jsonResponse['response']['startXI'];
      List lineups =
          starting.map((dynamic lineup) => Lineup.fromJson(lineup)).toList();
      List lineup =
          lineupMap.map((dynamic lineup) => Lineup.fromJson(lineup)).toList();
      return lineup;
    } else {
      print('Failed to load lineup');
      return null;
    }
  }
}
