import 'package:dart_app_2/services/ricky_api_service.dart';

void main(List<String> arguments) async {
// https://rickandmortyapi.com/api/character
/*
  Future<List<Articles>?> getTipoGet() async {
    Response response = await get('https://rickandmortyapi.com/api/character');
    Map data = jsonDecode(response.body);
    print(data);
  }
*/

  print('======================== MAIN IN ========================');

  // RickyApiService().getRickyCharacters();

  RickyApiService().getRickyEpisodes();

  print('======================== MAIN OUT ========================');
}
