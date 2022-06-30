// ignore_for_file: unnecessary_this

class Lineup {
  TeamData home;
  TeamData away;
  // int id;

  String clubName, clubLogo, coachName, coachImage, formation;
  String pos, player;
  int idClub, number, idCoach, idPlayer;

  Lineup({
    this.clubName,
    this.clubLogo,
    this.coachName,
    this.coachImage,
    this.formation,
    this.pos,
    this.player,
    this.number,
    //this.idCoach,
    //this.idPlayer
    //this.idClub,
  });

  Lineup.fromJson(Map<String, dynamic> parsedJson) {
    // Get Lineup
    // Define team
    this.clubName = parsedJson['team']['name'];
    this.clubLogo = parsedJson['team']['logo'];
    this.idClub = parsedJson['team']['id'];

    // Define coach
    this.idCoach = parsedJson['coach']['id'];
    this.coachName = parsedJson['coach']['name'];
    this.coachImage = parsedJson['coach']['photo'];

    // Define formation
    this.formation = parsedJson['formation'];

    // Define player
    this.player = parsedJson['startXI']['player']['name'] as String;
    this.idPlayer = parsedJson['startXI']['player']['id'] as int;
    this.number = parsedJson['startXI']['player']['number'] as int;
    this.pos = parsedJson['startXI']['player']['position'] as String;
  }
}

class TeamData {
  String clubName, clubLogo, coachName, coachImage, formation;
  String pos, player;
  int idClub, number, idCoach, idPlayer;

  TeamData(
      {this.clubName,
      this.clubLogo,
      this.coachName,
      this.coachImage,
      this.formation,
      this.pos,
      this.player,
      this.idClub,
      this.number,
      this.idCoach,
      this.idPlayer});

  TeamData.fromJson(Map<String, dynamic> parsedJson) {
    // Define team
    this.clubName = parsedJson['team']['name'];
    this.clubLogo = parsedJson['team']['logo'];
    this.idClub = parsedJson['team']['id'];

    // Define coach
    this.idCoach = parsedJson['coach']['id'];
    this.coachName = parsedJson['coach']['name'];
    this.coachImage = parsedJson['coach']['photo'];

    // Define formation
    this.formation = parsedJson['formation'];

    // Define player
    this.player = parsedJson['startXI']['player']['name'];
    this.idPlayer = parsedJson['startXI']['player']['id'];
    this.number = parsedJson['startXI']['player']['number'];
    this.pos = parsedJson['startXI']['player']['position'];
  }
}
