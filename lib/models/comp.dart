class CompModel {
  String logo;
  String name;

  CompModel(this.logo, this.name);
}

List<CompModel> comp = compData .map((item) =>
  CompModel(item['logo'], item['name'])).toList();

var compData = [
  {"logo": "assets/images/logo/UCL.png", "name": "UCL"},
  {"logo": "assets/images/logo/EPL.png", "name": "Premier League"},
  {"logo": "assets/images/logo/FA Cup.png", "name": "FA Cup"},
  {"logo": "assets/images/logo/Carabao.png", "name": "Carabao Cup"},
];