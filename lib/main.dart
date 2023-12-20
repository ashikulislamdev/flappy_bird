import 'package:flame/game.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:fleppy_bird/screens/game_over.dart';
import 'package:fleppy_bird/screens/main_menu.dart';
import 'package:flutter/material.dart';


void main() {
  final game = FlappyBirdGame(); 

  runApp(
    GameWidget(  //gamewidget is come from flame 
      game: game,
      initialActiveOverlays: const [MianMenuScreen.id], //ensuring our initial overlay is always mainMenu
      overlayBuilderMap: {
        'mainMenu' : (context, _) => MianMenuScreen(game: game),
        'gameOver' : (context, _) => GameOverScreen(game: game),
      },
    )
  );
}

