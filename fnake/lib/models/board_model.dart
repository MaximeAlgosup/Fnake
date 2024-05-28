import 'package:fnake/models/tile_model.dart';

class BoardModel {
  final int nbRows;
  final int nbColumns;
  List<List<TileModel>> tileList =[];

  BoardModel({required this.nbRows, required this.nbColumns}){
    for (int i = 0; i < nbColumns; i++) {
      List<TileModel> row = [];
      for (int j = 0; j < nbRows; j++) {
        row.add(TileModel(posX: i, posY: j, width: 20.0, height: 20.0));
      }
      tileList.add(row);
    }
  }

  TileModel getTile(int x, int y) {
    return tileList[x][y];
  }

}