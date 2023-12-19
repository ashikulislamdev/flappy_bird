import 'package:flame/game.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:flutter/material.dart';


void main() {
  final game = FlappyBirdGame(); 

  runApp(
    GameWidget(game: game)  //gamewidget is come from flame 
  );
}

