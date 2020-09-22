class Data {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  Data({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  Data.formJsonMap(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'];
  }
}

class Ad {
  String company;
  String url;
  String text;

  Ad({
    this.company,
    this.url,
    this.text,
  });

  Ad.formJsonMap(Map<String, dynamic> json){
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }
}

class Person {
  Data data;
  Ad ad;

  Person({
    this.data,
    this.ad
  });
}

class Persona{

  Person person = new Person();

  Persona.formJsonMap(Map<String, dynamic> json){
    var dataJson = json['data'];
    var adJson   = json['ad'];
    Data data = Data.formJsonMap(dataJson);
    Ad ad = Ad.formJsonMap(adJson);

    person = new Person(data: data, ad: ad);

  }
}

