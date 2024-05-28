import 'package:flutter/material.dart';

import 'package:fnake/models/tile_model.dart';

class TileWidget extends StatelessWidget {
  final TileModel tile;

  const TileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        color: Colors.blueGrey,
      ),
    );
  }
}