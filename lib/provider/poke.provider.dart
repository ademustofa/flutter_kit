import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/poke.model.dart';
import 'package:flutter_application_test/services/pokemon.service.dart';


class PokemonProvider with ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  
  List<Pokemon> _pokemons = [];
  PokemonDetail? _detailPokemon;
  
  bool _isLoading = false;

  List<Pokemon> get pokemons => _pokemons;
  PokemonDetail? get detailPokemon => _detailPokemon;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemons() async {
    _isLoading = true;
    notifyListeners();

    try {
      _pokemons = await _pokemonService.fetchPokemons();
    } catch (e) {
      // Handle error
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> fetchDetailPokemon(String name) async {
    _isLoading = true;
    notifyListeners();

    try {
      _detailPokemon = await _pokemonService.fetchDetailPokemon(name);
      // print('detail pokemon :${_detailPokemon}');
    } catch (e) {
      // Handle error
      print('error request detail :${e}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}