import 'package:flutter/material.dart';
import 'package:fnake/enums/direction_enum.dart';
import 'package:fnake/models/snake_model.dart';

class ArrowWidget extends StatelessWidget {
  final Direction direction;
  final SnakeModel? snake;

  const ArrowWidget({super.key, required this.direction, required this.snake});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(snake != null){
          snake!.changeDirection(direction);
          snake!.move();
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.circular(48),
          color: Colors.black,
        ),
        child: Icon(
          direction == Direction.up
              ? Icons.arrow_upward
              : direction == Direction.down
              ? Icons.arrow_downward
              : direction == Direction.left
              ? Icons.arrow_back
              : Icons.arrow_forward,
          color: Colors.blueGrey,
        ),
      )
    );
  }
}
