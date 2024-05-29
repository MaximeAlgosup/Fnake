import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fnake/models/board_model.dart';
import 'package:fnake/providers/game_provider.dart';

import 'package:fnake/widgets/tile_widget.dart';

class BoardWidget extends StatefulWidget {
  final BoardModel board;
  final WidgetRef ref;

  const BoardWidget({super.key, required this.board, required this.ref});

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  BoardModel get board => widget.board;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
        widget.ref.read(gameNotifier.notifier).moveSnake();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: board.nbColumns,
      ),
      itemBuilder: (context, index) {
        return TileWidget(
          tile: board.tileList[index % board.nbColumns][index ~/ board.nbColumns],
        );
      },
      itemCount: board.nbRows * board.nbColumns,
    );
  }
}