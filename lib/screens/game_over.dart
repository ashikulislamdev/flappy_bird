import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Restart', style: TextStyle(fontSize: 20, color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }

  void onRestart(){
    game.bird.resetGame();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}