import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';

//parallaxComonent to make the ground in parallax motion
class Ground extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Ground();

  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground); 

    //useing parallax widget, can use multiple as needed
    parallax = Parallax([
      ParallaxLayer(
       ParallaxImage(ground, fill: LayerFill.none) 
      )
    ]);
    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - GameConfig.groundHight),
      size: Vector2(gameRef.size.x, GameConfig.groundHight)
    ));
  }

  //update itself with respect to game time
  //update mathod is required to time delta, which represent one cycle of the game
  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = GameConfig.gameSpead;
  }
}