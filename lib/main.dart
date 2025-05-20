import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});


  final List<Contato> contatos = [
    Contato('Alma Christensen', 'alma.christensen@example.com'),
    Contato('Sergio Hill', 'sergio.hill@example.com'),
    Contato('Malo Gonzalez', 'malo.gonzalez@example.com'),
    Contato('Miguel Owens', 'miguel.owens@example.com'),
    Contato('Lilou Dumont', 'lilou.dumont@example.com'),
    Contato('Ashley Stewart', 'ashley.stewart@example.com'),
    Contato('Roman Zhang', 'roman.zhang@example.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index){
            final contato = contatos[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(contato.nome[0]),
              ),
              title: Text(contato.nome),
              subtitle: Text(contato.email),
            );
          }
        ),
      ),
    );
  }
}

class Contato{

  final String  nome;
  final String email;

  Contato(this.nome, this.email);
}
