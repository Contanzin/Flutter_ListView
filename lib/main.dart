import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      title: 'Contatos',
      home: ContatosPage(),
    );
  }
}



class Contato{

  final String  nome;
  final String email;
  bool like;

  Contato(this.nome, this.email, {this.like = false});

}

class ContatosPage extends StatefulWidget {
  @override
  _ContatosPageState createState() => _ContatosPageState();
}


class _ContatosPageState extends State<ContatosPage>{
  final List<Contato> contatos = [
    Contato('Alma Christensen', 'alma.christensen@example.com',),
    Contato('Sergio Hill', 'sergio.hill@example.com', ),
    Contato('Malo Gonzalez', 'malo.gonzalez@example.com', ),
    Contato('Miguel Owens', 'miguel.owens@example.com', ),
    Contato('Lilou Dumont', 'lilou.dumont@example.com', ),
    Contato('Ashley Stewart', 'ashley.stewart@example.com', ),
    Contato('Roman Zhang', 'roman.zhang@example.com', ),
  ];

  void toggleFavorito(int index) {
    setState(() {
      contatos[index].like = !contatos[index].like;
    });
  }

    int get totalFavoritos {
    return contatos.where((c) => c.like).length;
  }


     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Contatos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favoritos: $totalFavoritos',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contato = contatos[index];
                return ListTile(
                  title: Text(contato.nome),
                  subtitle: Text(contato.email),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: contato.like ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => toggleFavorito(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
