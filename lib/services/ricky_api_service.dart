import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'dart:async' show Future;

import '../models/character_model.dart';
import '../models/episodio_model.dart';

// https://rickandmortyapi.com/api/episode
// https://rickandmortyapi.com/api/character

class RickyApiService {
  EpisodioModel episodioModel = EpisodioModel();

  void getRickyEpisodes() {
    var url = Uri.parse("https://rickandmortyapi.com/api/episode");
    //print(url);
    http.get(url).then((response) {
      print("=== RESPUESTA DEL BODY =========================================");
      print(response.body);
      print(
          "=== DECODIFICANDO DEL BODY =========================================");
      Map<String, dynamic> bodyDecoded = convert.jsonDecode(response.body);
      print(bodyDecoded);

      print(
          "=== VALIDACIÓN ES INSTANCIA =========================================");
      EpisodioModel personaje = new EpisodioModel.fromJson(bodyDecoded);
      print(personaje.info);
      print(personaje.results);

      print(
          "=== EXTRACCIÓN DE DATOS =========================================");

      print("PRIMER PERSONAJE : ");
      print(personaje.results?[0].name);

      print("IMPRIMIR NOMBRES PERSONAJES DE CADA : ");
      for (var i = 0; i < personaje.results!.length; i++) {
        if (personaje.results?[i] != null) {
          print(
              "Nombre: ${personaje.results?[i].name} | episode: ${personaje.results?[i].episode}");
        }
      }

      print("=== FIN ;) =========================================");
    }).catchError((err) {
      print(err);
    });
  }

  CharacterModel characterModel = CharacterModel();

  void getRickyCharacters() {
    var url = Uri.parse("https://rickandmortyapi.com/api/character");
    //print(url);
    http.get(url).then((response) {
      print("=== RESPUESTA DEL BODY =========================================");
      /*String stringBodyResult = response.body
          .replaceAll("\"name\":\"Earth (C-137)\"", "\"name\":\"Earth C-137\"");
          */

      //      print(response.body);

      //print(stringBodyResult);
      //String convierteEsto = response.body;
      // String convierteEsto = stringBodyResult;
      //stringBodyResult
      //final List<dynamic> bodyDecoded = convert.jsonDecode(response.body);
      //final List<dynamic> bodyDecoded = convert.jsonDecode(response.body);

      Map<String, dynamic> bodyDecoded = convert.jsonDecode(response.body);
      //List<dynamic> data = bodyDecoded["info"];
//      print(data[0]["name"]);

      print(
          "=== DECODIFICANDO DEL BODY =========================================");
      print(bodyDecoded);

      CharacterModel personaje = new CharacterModel.fromJson(bodyDecoded);

      print(
          "=== VALIDACIÓN ES INSTANCIA =========================================");

      print(personaje.info);
      //print(personaje.info.toString());
      print(personaje.results);
/*
      Future loadStudent() async {
        String jsonString = await _loadAStudentAsset();
        final jsonResponse = json.decode(jsonString);
        Student student = new Student.fromJson(jsonResponse);
        print(student.studentScores);
      }
*/
/*
      for (var i = 0; i < personaje.results.length; i++) {
        if (personaje[i] != null) {
          print(
              "Pais: ${listPaises[i].name} | Habitantes: ${listPaises[i].population}");
        }
      }
*/

      print(
          "=== EXTRACCIÓN DE DATOS =========================================");

      print(personaje.results?[0].name);

      for (var i = 0; i < personaje.results!.length; i++) {
        if (personaje.results?[i] != null) {
          print(
              "Nombre: ${personaje.results?[i].name} | Status: ${personaje.results?[i].status} | Status: ${personaje.results?[i].species}");
        }
      }

      print("=== FIN ;) =========================================");
    }).catchError((err) {
      print(err);
    });
  }

/*
  Future<List<Articles>?> getTipoGet() async {
    Response response = await get('https://rickandmortyapi.com/api/character');
    Map data = jsonDecode(response.body);
    print(data);
  }
*/

}
