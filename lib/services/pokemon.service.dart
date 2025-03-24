import 'dart:convert';
import 'package:flutter_application_test/models/poke.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void printPrettyJson(Map<String, dynamic> json) {
  const encoder = JsonEncoder.withIndent('  '); // Use 2 spaces for indentation
  final prettyJson = encoder.convert(json);
  print(prettyJson);
}

class PokemonService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemons({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  Future<PokemonDetail> fetchDetailPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/${name}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
       printPrettyJson(data);
      return PokemonDetail.fromJson(data);
    } else {
      throw Exception('Failed to load pokemons');
    }
  }


}