import 'dart:convert';

import 'package:hola_mundo/src/model/person_model.dart';
import 'package:http/http.dart' as http;


class UserService{

  String _url = 'reqres.in';
  String _requestUser = 'api/users/2';

  Future<dynamic> getUser() async{

    final url = Uri.https(_url, _requestUser);

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final persona = new Persona.formJsonMap(decodedData);
    return persona.person;

  }

}