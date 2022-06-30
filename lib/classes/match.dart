// ignore_for_file: unused_field, non_constant_identifier_names, unnecessary_this, prefer_collection_literals
class Match {
  int _id;
  String _event, _opponent, _date, _score_team, _score_opponent;

  // ID Getter
  int get id => _id;

  // Event Setter & Getter
  String get event => this._event;
  set event(String value) => this._event = value;

  // Score Team Setter & Getter
  get score_team => this._score_team;
  set score_team(value) => this._score_team = value;

  // Score Opponent Setter & Getter
  get score_opponent => this._score_opponent;
  set score_opponent(value) => this._score_opponent = value;

  // Opponent Setter & Getter
  String get opponent => this._opponent;
  set opponent(String value) => this._opponent = value;

  // Date Setter & Getter
  String get date => this._date;
  set date(String value) => this._date = value;

  Match(
    this._event,
    this._score_team,
    this._score_opponent,
    this._opponent,
    this._date,
  );

  Match.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._event = map['event'];
    this._score_team = map['score_team'];
    this._score_opponent = map['score_opponent'];
    this._opponent = map['opponent'];
    this._date = map['date'];
  }

  factory Match.fromMatch(Match match) {
    return Match(
      match.event,
      match.score_team,
      match.score_opponent,
      match.opponent,
      match.date,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['event'] = event;
    map['score_team'] = score_team;
    map['score_opponent'] = score_opponent;
    map['opponent'] = opponent;
    map['date'] = date;
    return map;
  }
}
