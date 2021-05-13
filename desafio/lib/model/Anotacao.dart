

class Anotacao{

  int id;
  String idjogo;
  String name;
  String price;
  String score;
  String image;

  Anotacao(this.idjogo, this.name, this.price, this.score, this.image);


  Anotacao.fromMap(Map map){

    this.id = map["id"];
    this.idjogo = map["idjogo"];
    this.name = map["name"];
    this.price = map["price"];
    this.score = map["score"];
    this.image = map["image"];

  }

  Map toMap(){

    Map<String, dynamic> map = {
      "idjogo": this.idjogo,
      "name"  : this.name,
      "price" : this.price,
      "score" : this.score,
      "image" : this.image
    };

    return map;

  }

}