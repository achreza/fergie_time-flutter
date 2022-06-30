class ClubModel {
  String image;

  ClubModel(this.image);
}

List<ClubModel> club =
clubData.map((item) => ClubModel(item['image'])).toList();

var clubData = [
  {"image": "assets/images/club/pic1.jpg"},
  {"image": "assets/images/club/pic2.jpg"},
  {"image": "assets/images/club/pic3.jpg"},
  {"image": "assets/images/club/pic4.jpg"},
  {"image": "assets/images/club/pic5.jpg"},
  {"image": "assets/images/club/pic6.jpg"},
  {"image": "assets/images/club/pic7.jpg"},
];