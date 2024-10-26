import 'package:flutter/material.dart';

void main() {
  runApp(const CachoApp());
}

class CachoApp extends StatelessWidget {
  const CachoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removido el debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: const CachoScreen(),
    );
  }
}

class CachoScreen extends StatefulWidget {
  const CachoScreen({super.key});

  @override
  State<CachoScreen> createState() => _CachoState();
}

class _CachoState extends State<CachoScreen> {
  int selectedPlayers = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRACTICA 1 INF-632 Univ. Marcelo Choque Cruz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Grilla principal
            const Expanded(
              child: SinglePlayerGrid(),
            ),

            // Selector de jugadores e Iniciar Juego
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButton<int>(
                      value: selectedPlayers,
                      items: List.generate(5, (index) {
                        int players = index + 2;
                        return DropdownMenuItem(
                          value: players,
                          child: Text('$players Jugadores'),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          selectedPlayers = value!;
                        });
                      },
                      underline: Container(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CachoBoardsScreen(
                            numberOfPlayers: selectedPlayers,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Juego',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para la grilla de un solo jugador
class SinglePlayerGrid extends StatefulWidget {
  const SinglePlayerGrid({super.key});

  @override
  State<SinglePlayerGrid> createState() => _SinglePlayerGridState();
}

class _SinglePlayerGridState extends State<SinglePlayerGrid> {
  int balasCount = 0;
  int escaleraCount = 0;
  int tontosCount = 0;
  int tricasCount = 0;
  int cuadrasCount = 0;
  int quinasCount = 0;
  int cenasCount = 0;
  int fullCount = 0;
  int pokerCount = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 1.5,
      children: [
        botonAccionConIcono(
          'Balas: $balasCount',
          () => setState(
              () => balasCount = (balasCount < 5) ? balasCount + 1 : 0),
          Icons.local_fire_department,
          Colors.red,
        ),
        botonAccionConIcono(
          'Escalera: $escaleraCount',
          () => setState(() => escaleraCount = (escaleraCount == 0)
              ? 20
              : (escaleraCount == 20)
                  ? 25
                  : 0),
          Icons.trending_up,
          Colors.green,
        ),
        botonAccionConIcono(
          'Cuadras: $cuadrasCount',
          () => setState(
              () => cuadrasCount = (cuadrasCount < 20) ? cuadrasCount + 4 : 0),
          Icons.square_foot,
          Colors.blue,
        ),
        botonAccionConIcono(
          'Tontos: $tontosCount',
          () => setState(
              () => tontosCount = (tontosCount < 10) ? tontosCount + 2 : 0),
          Icons.mood_bad,
          Colors.orange,
        ),
        botonAccionConIcono(
          'FULL: $fullCount',
          () => setState(() => fullCount = (fullCount == 0)
              ? 30
              : (fullCount == 30)
                  ? 35
                  : 0),
          Icons.fullscreen,
          Colors.purple,
        ),
        botonAccionConIcono(
          'Quinas: $quinasCount',
          () => setState(
              () => quinasCount = (quinasCount < 25) ? quinasCount + 5 : 0),
          Icons.looks_5,
          Colors.cyan,
        ),
        botonAccionConIcono(
          'Tricas: $tricasCount',
          () => setState(
              () => tricasCount = (tricasCount < 15) ? tricasCount + 3 : 0),
          Icons.looks_3,
          Colors.yellow,
        ),
        botonAccionConIcono(
          'POKER: $pokerCount',
          () => setState(() => pokerCount = (pokerCount == 0)
              ? 40
              : (pokerCount == 40)
                  ? 45
                  : 0),
          Icons.casino,
          Colors.teal,
        ),
        botonAccionConIcono(
          'Cenas: $cenasCount',
          () => setState(
              () => cenasCount = (cenasCount < 30) ? cenasCount + 6 : 0),
          Icons.dinner_dining,
          Colors.brown,
        ),
      ],
    );
  }

  Widget botonAccionConIcono(
    String texto,
    VoidCallback onPressed,
    IconData icono,
    Color colorIcono,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.blue, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono, color: colorIcono, size: 24),
          const SizedBox(height: 4),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Pantalla de tableros múltiples
class CachoBoardsScreen extends StatelessWidget {
  final int numberOfPlayers;

  const CachoBoardsScreen({
    super.key,
    required this.numberOfPlayers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableros de Cacho - $numberOfPlayers Jugadores'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: numberOfPlayers,
        itemBuilder: (context, index) {
          return PlayerBoard(playerNumber: index + 1);
        },
      ),
    );
  }
}

// Widget para el tablero individual de cada jugador
class PlayerBoard extends StatelessWidget {
  final int playerNumber;

  const PlayerBoard({
    super.key,
    required this.playerNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Jugador $playerNumber',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1),
          // Grilla interactiva para cada jugador
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: SinglePlayerGrid(),
            ),
          ),
        ],
      ),
    );
  }
}
