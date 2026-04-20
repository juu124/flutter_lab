// flutter_staggered_grid_view.........
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget tile(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StaggeredGrid'),),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2, // span 개념
                  mainAxisCellCount: 2,
                  child: tile('2X2', Colors.blue),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1, // span 개념
                mainAxisCellCount: 1,
                child: tile('1X1', Colors.red),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1, // span 개념
                mainAxisCellCount: 1,
                child: tile('1X1', Colors.orange),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4, // span 개념
                mainAxisCellCount: 1,
                child: tile('4X1', Colors.green),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1, // span 개념
                mainAxisCellCount: 2,
                child: tile('1X2', Colors.purple),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3, // span 개념
                mainAxisCellCount: 1,
                child: tile('3X1', Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}