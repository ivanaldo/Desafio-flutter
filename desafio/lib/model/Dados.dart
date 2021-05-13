

class Dados {
  int _id;
  String _name;
  double _price;
  int _score;
  String _image;

  Dados();

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}