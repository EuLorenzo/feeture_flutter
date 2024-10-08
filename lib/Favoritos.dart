import 'package:flutter/material.dart';
import 'filme.dart';

class Favoritos extends StatefulWidget {
  final List<Filme> filmesFavoritos;
  final Function(Filme) onRemove;

  const Favoritos({Key? key, required this.filmesFavoritos, required this.onRemove}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        backgroundColor: const Color.fromARGB(255, 20, 22, 24),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../imagens/skyhd.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.filmesFavoritos.length,
          itemBuilder: (context, index) {
            final filme = widget.filmesFavoritos[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(filme.title),
                leading: Image.asset(filme.imagePath, width: 50, height: 50),
                subtitle: Text(filme.description),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    widget.onRemove(filme);
                    setState(() {}); 
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
