
class TileModel {

  final int posX;
  final int posY;
  final double width;
  final double height;

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

  @override
  String toString() {
    return 'X: $posX, Y: $posY';
  }
}