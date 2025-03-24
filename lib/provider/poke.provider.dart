import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/poke.model.dart';
import 'package:flutter_application_test/services/pokemon.service.dart';


class PokemonProvider with ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  
  List<Pokemon> _pokemons = [];
  PokemonDetail? _detailPokemon;
  
  bool _isLoading = false;
  bool _hasMore = true;
  int _offset = 0;
  final int _limit = 20;


  List<Pokemon> get pokemons => _pokemons;
  PokemonDetail? get detailPokemon => _detailPokemon;

  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchPokemons({bool loadMore = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    
     if (!loadMore) {
      _offset = 0;
      _hasMore = true;
    }
    notifyListeners();

    try {
      final newPokemons = await _pokemonService.fetchPokemons(  
        limit: _limit,
        offset: _offset
      );
      
      if (loadMore) {
        _pokemons.addAll(newPokemons);
      } else {
        _pokemons = newPokemons;
      }

       _offset += _limit;
      _hasMore = newPokemons.isNotEmpty;
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