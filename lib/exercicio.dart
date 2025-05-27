import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}
class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      themeMode: _themeMode,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: PokedexPage(onThemeChanged: toggleTheme, isDark: _themeMode == ThemeMode.dark),
    );
  }
}

class Pokemon {
  final String nome;
  final String regiao;
  bool capturado;

  Pokemon(this.nome, this.regiao, {this.capturado = false});
}

class PokedexPage extends StatefulWidget{
  final Function(bool) onThemeChanged;
  final bool isDark;

  PokedexPage({required this.onThemeChanged, required this.isDark});

  @override
  _PokedexPageState createState() => _PokedexPageState();

}

class _PokedexPageState extends State<PokedexPage>{
  final List<Pokemon> pokedex = [
    Pokemon("Charmander", "Kanto"),
    Pokemon("Bubasauor", "Kanto"),
    Pokemon("Squirtle", "Kanto"),
    Pokemon("Torchic", "Hoenn"),
    Pokemon("Trecko", "Hoenn"),
    Pokemon("Mudkip", "Hoenn"),
  ];

  void toggleCapturado(int index){
    setState(() {
      pokedex[index].capturado = !pokedex[index].capturado;
    });
  }
  int get TotalCapturados{
    return pokedex.where((c)=> c.capturado).length;
  }
    @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(title: const Text("Pokedex"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
           UserAccountsDrawerHeader(
                accountName: Text('MaryCarvajal'),
                accountEmail: Text('Lindinha@gmail.com'),
                currentAccountPicture: CircleAvatar(
 
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
              ),
               Padding(
                  padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Pokemons Capturados: $TotalCapturados',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Spacer(), // empurra o switch para o final
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Modo Escuro", style: TextStyle(fontSize: 16)),
                  Switch(
                    value: widget.isDark,
                    onChanged: widget.onThemeChanged,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
            child: ListView.builder(
            itemCount: pokedex.length,
            itemBuilder: (context, index){
              final pokemon = pokedex[index];
              return ListTile(
                title: Text(pokemon.nome),
                subtitle: Text(pokemon.regiao),
                trailing: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: pokemon.capturado? Colors.lightGreenAccent : Colors.grey,
                  ),
                  onPressed: () => toggleCapturado(index),
                ),
              );
            } ))
        ],
      ),
    );
  }

}