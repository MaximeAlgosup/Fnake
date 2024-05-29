import 'dart:math';

class FoodModel {
  FoodModel({
    required this.value,
  });

  Random random = Random();
  int posX = 0;
  int posY = 0;
  final int value;

  void generateNewPosition() {
    posX = random.nextInt(10);
    posY = random.nextInt(10);
  }

  void setPositon(int x, int y) {
    posX = x;
    posY = y;
  }

  int getX() {
    return posX;
  }

  int getY() {
    return posY;
  }
}