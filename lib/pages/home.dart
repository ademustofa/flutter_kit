import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// model
import 'package:flutter_application_test/models/poke.model.dart';

// View model
import 'package:flutter_application_test/provider/poke.provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final pokeModel = Provider.of<PokemonProvider>(context, listen: false);
    pokeModel.fetchPokemons();
    _scrollController.addListener(_scrollListener);
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      final pokeModel = Provider.of<PokemonProvider>(context, listen: false);
      if (!pokeModel.isLoading && pokeModel.hasMore) {
        pokeModel.fetchPokemons(loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokeModel = Provider.of<PokemonProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007B43),
        iconTheme: IconThemeData(
          color: Colors.white, // Changes back button & drawer icon color
        ),
        title: Text('Pokemon List', style: TextStyle(color: Colors.white),),
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification &&
                _scrollController.position.extentAfter == 0) {
              if (!pokeModel.isLoading && pokeModel.hasMore) {
                pokeModel.fetchPokemons(loadMore: true);
              }
            }
            return false;
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: pokeModel.pokemons.length + (pokeModel.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= pokeModel.pokemons.length) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              Pokemon pokemon = pokeModel.pokemons[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile',
                      arguments: pokemon.name);
                },
                child: ListTile(
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.url),
                ),
              );
            },
          )),
    );
  }
}
