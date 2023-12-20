import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:flutter/material.dart';

class MianMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  
  const MianMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    //before starting game it'll be pause
    game.pauseEngine();


    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.menu),
            fit: BoxFit.cover
            )
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}