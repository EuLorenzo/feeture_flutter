import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
        backgroundColor: const Color.fromARGB(255, 20, 22, 24),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../imagens/skyhd.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            CategoryTile(title: "Ação"),
            CategoryTile(title: "Comédia"),
            CategoryTile(title: "Drama"),
            CategoryTile(title: "Ficção Científica"),
            CategoryTile(title: "Terror"),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;

  const CategoryTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        tileColor: Colors.black54,
        onTap: () {
         
        },
      ),
    );
  }
}
