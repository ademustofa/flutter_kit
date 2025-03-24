import 'package:flutter/material.dart';
import 'package:flutter_application_test/provider/poke.provider.dart';
import 'package:provider/provider.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? pokemonName;
  int ninjalevel = 0;

  @override
  void initState() {
    super.initState();

    // Use addPostFrameCallback to access the context after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as String?;
      final call = context.read<PokemonProvider>();
      if (args != null) {
        // print("param: ${args}")
        call.fetchDetailPokemon(args);
        setState(() {
          pokemonName = args;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
     final pokemonModel = Provider.of<PokemonProvider>(context);
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Pokemon Detail', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: pokemonModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(pokemonModel.detailPokemon!.imageUrl),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Color.fromARGB(255, 66, 66, 66),
            ),
            Text(
              "NAME",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(height: 5),
            Text(
              "${pokemonModel.detailPokemon!.name}",
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 30),
            Text(
              "Current Ninja Level",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(height: 5),
            Text(
              '$ninjalevel',
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 158, 158, 158)
                ),
                SizedBox(width: 10),
                Text(
                "souma.yukihira@gmail.com",
                style: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 158),
                    letterSpacing: 1.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              ]
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        shape: CircleBorder(),
        onPressed: () {
          setState(() {
            ninjalevel += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
