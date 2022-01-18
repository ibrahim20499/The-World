

class Country {

  String name;
  String native;
  String phone;
  String continent;
  String capital;
  String currency;
  List<String> languages;
  String emoji;
  String emojeiU;

  Country({this.name, this.native, this.phone, this.continent,this.capital,this.currency,
  this.emojeiU,this.emoji,this.languages});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json["name"],
        native: json["native"],
        phone: json["phone"],
        continent: json["continent"],
        capital: json["capital"],
        currency: json["currency"],
        languages:(json["languages"]).toList ,
        emoji: json["emoje"],
        emojeiU: json["emojeUi"],

    );
  }
  static List<String> toList(List<dynamic> list){
    return List<String>.from(list);
  }
}