import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/enums/direction_enum.dart';
import 'package:fnake/providers/game_provider.dart';
import 'package:fnake/widgets/arrow_widget.dart';
import 'package:fnake/widgets/board_widget.dart';
import 'package:fnake/models/game_model.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameModel game = ref.watch(gameNotifier);
    // ref.read(gameNotifier.notifier).startGame();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Center(
            child: Text(
              'Fnake',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Column(children: <Widget>[
        Expanded(
          child: BoardWidget(board: game.board),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ArrowWidget(direction: Direction.up, snake: game.getSnake)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ArrowWidget(direction: Direction.left, snake: game.getSnake),
            const SizedBox(width: 54),
            ArrowWidget(direction: Direction.right, snake: game.getSnake),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ArrowWidget(direction: Direction.down, snake: game.getSnake)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () => ref.read(gameNotifier.notifier).startGame(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: const BorderSide(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
                child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            )
          ],
        ),
        const Row(
          children: <Widget>[SizedBox(height: 100)],
        )
      ]),
    );
  }
}
