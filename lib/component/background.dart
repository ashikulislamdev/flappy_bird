import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';

//create background class which extends sprite component, it can represent 2d image or texture that can displaied and manipulated by the game. add HasGameRef to access gameRef which allow us to access various functionalities available in the game context. 
class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Background(); //create the constractor

  //load the image 
  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);  //specified image with the file name 
    size = gameRef.size;  //specify the size of the background 
    sprite = Sprite(background);  //assign the background image to Sprite property, it'll create a new instance of the spirte 
  }
}