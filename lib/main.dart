import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/filme.dart';
import 'FilmeDetalhe.dart';
import 'Categorias.dart';
import 'Favoritos.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Filme> filmesFavoritos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 22, 24),
        title: Row(
          children: [
            Image.asset(
              '../imagens/Penasemfundo.png',
              width: 60,
              height: 120,
            ),
            const SizedBox(width: 0),
            const Text("Feeture"),
            const SizedBox(width: 30),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white12,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text("Categorias"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Categorias()),
                );
              },
            ),
            ListTile(
              title: const Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favoritos(
                      filmesFavoritos: filmesFavoritos,
                      onRemove: (filme) {
                        setState(() {
                          filmesFavoritos.remove(filme);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Sair"),
              onTap: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../imagens/skyhd.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Favoritos da Semana",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  _buildFavoriteItem(context, "O Ditador", "../imagens/ditadoraladin.jpg", "A heróica história do General Aladeen, ditador da República de Wadiya, localizada no norte da África. Ele dedica sua vida inteira a garantir que a democracia jamais chegue ao seu país, enquanto ergue estátuas em sua homenagem e cria seus próprios Jogos Olímpicos."),
                  _buildFavoriteItem(context, "Onde Vivem os Monstros", "../imagens/ondevivemmonstros.jpg", "Onde Vivem os Monstros é um filme sobre um garoto de aproximadamente 10 anos de idade que está em plena crise. O pai é ausente, a mãe está sempre ocupada entre o trabalho e o novo namorado, a irmã não tem paciência, os colegas estão distantes. Max, o protagonista, resolve fugir de casa e usa a imaginação para criar uma misteriosa ilha. Lá ele encontra vários monstros, que vivem em bando. Max afirma possuir poderes e acaba nomeado rei do grupo. Responsável por evitar que a tristeza tome conta do lugar, ele passa a criar uma série de jogos para mantê-los em constante diversão."),
                  _buildFavoriteItem(context, "Ratatoing", "../imagens/ratatoing.jpg", "Ratatoing conta a história de Marcell Toing, um rato que é o chef mais talentoso no Rio de Janeiro. Ele é dono do restaurante famoso 'Ratatoing', juntamente com sua tripulação, composta por ratos colega Carol e Greg."),
                  _buildFavoriteItem(context, "Kung Fusão", "../imagens/kungfusao.jpg", "Em uma cidade controlada pela gangue Axe, Sing quer desesperadamente se tornar um membro. Ele vai para um cortiço comandado por excêntricos senhorios que se revelam mestres do kung fu disfarçados. As ações de Sing eventualmente acabam provocando um explosivo confronto de kung fu entre a gangue Axe e os senhorios."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(BuildContext context, String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        setState(() {
          filmesFavoritos.add(Filme(title: title, imagePath: imagePath, description: description)); 
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FilmeDetalhe(
              title: title,
              imagePath: imagePath,
              description: description,
              youtubeUrl: 'https://www.youtube.com/watch?v=rxCs1fGxloI', 
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Colors.black54,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
