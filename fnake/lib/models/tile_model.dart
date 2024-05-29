
class TileModel {

  final int posX;
  final int posY;
  final double width;
  final double height;
  bool isSnake = false;
  bool isSnakeHead = false;
  bool isFood = false;

  TileModel({required this.posX, required this.posY, required this.width, required this.height});



  int getX() {
    return posX;
  }

  int getY() {
    return posY;
  }

  double getWidth() {
    return width;
  }

  double getHeight() {
    return height;
  }

  void setSnake(bool isSnake) {
    this.isSnake = isSnake;
  }

  void setSnakeHead(bool isSnakeHead) {
    this.isSnakeHead = isSnakeHead;
  }

  void setFood(bool isFood) {
    this.isFood = isFood;
  }

  @override
  String toString() {
    return 'X: $posX, Y: $posY';
  }
}