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

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final call = context.read<PokemonProvider>();
      call.fetchPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemonModel = Provider.of<PokemonProvider>(context);

     return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon List'),
      ),
      body: pokemonModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pokemonModel.pokemons.length,
              itemBuilder: (context, index) {
                Pokemon pokemon = pokemonModel.pokemons[index];
                return GestureDetector(
                   onTap: () {
                    Navigator.pushNamed(context, '/profile', arguments: pokemon.name);
                  },
                  child: ListTile(
                    title: Text(pokemon.name),
                    subtitle: Text(pokemon.url),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pokemonModel.fetchPokemons();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
