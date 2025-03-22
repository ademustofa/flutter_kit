class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonDetail {
  final String name;
  final int id;
  final int height;
  final int weight;
 final List<String> types;
  final String imageUrl;

  PokemonDetail(
      {required this.name,
      required this.id,
      required this.height,
      required this.weight,
      required this.types,
      required this.imageUrl});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      name: json['name'],
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      imageUrl: json['sprites']['front_default'],
    );
  }
}
