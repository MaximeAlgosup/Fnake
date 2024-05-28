import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/enums/direction_enum.dart';
import 'package:fnake/providers/game_provider.dart';
import 'package:fnake/widgets/arrow_widget.dart';
import 'package:fnake/widgets/board_widget.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var game = ref.watch(gameNotifier);
    // ref.read(gameNotifier.notifier).startGame();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Center(
            child: Text(
              'Fnake',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
            child: BoardWidget(board: game.board),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ArrowWidget(direction: Direction.up)],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArrowWidget(direction: Direction.left),
              SizedBox(width: 54),
              ArrowWidget(direction: Direction.right),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ArrowWidget(direction: Direction.down)],
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
      ),
    );
  }
}
