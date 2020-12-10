class Slides {
  final String imagePath;

  Slides(this.imagePath);
}

List<Slides> slides = slideData
    .map((item) => Slides(
          item['imagePath'],
        ))
    .toList();

var slideData = [
  {"imagePath": "assets/images/cover.jpg"},
  {"imagePath": "assets/images/cover-back.jpg"},
];
