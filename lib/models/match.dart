// ignore_for_file: unnecessary_this

class Match {
  int idMatch, idTeam, idOpponent;
  // int team, league, season; // Mengarah ke URL
  int goalsHome, goalsAway;
  String teamName, teamOpp;
  String teamLogo, oppLogo;
  String venue, city;
  String nameLeague, logoLeague, round;
  int seasonLeague;

  Match(
      {this.idMatch,
      this.idTeam,
      this.idOpponent,
      // this.team,
      // this.league,
      // this.season,
      this.goalsHome,
      this.goalsAway,
      this.teamName,
      this.teamOpp,
      this.teamLogo,
      this.oppLogo,
      this.venue,
      this.city});

  Match.fromJson(Map<String, dynamic> parsedJson) {
    this.idMatch = parsedJson['fixture']['id'];

    // Get Venue
    this.venue = parsedJson['fixture']['venue']['name'];
    this.city = parsedJson['fixture']['venue']['city'];

    // Get League
    this.nameLeague = parsedJson['league']['name'];
    this.logoLeague = parsedJson['league']['logo'];
    this.seasonLeague = parsedJson['league']['season'];
    this.round = parsedJson['league']['round'];

    // Get Team MU
    this.teamName = parsedJson['teams']['home']['name'];
    this.teamLogo = parsedJson['teams']['home']['logo'];

    // Get Team Opponent
    this.teamOpp = parsedJson['teams']['away']['name'];
    this.oppLogo = parsedJson['teams']['away']['logo'];

    // Get Score
    this.goalsHome = parsedJson['goals']['home'];
    this.goalsAway = parsedJson['goals']['away'];
  }
}
