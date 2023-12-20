import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/bird_movement.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:flutter/widgets.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>, CollisionCallbacks{
  Bird();

  @override
  FutureOr<void> onLoad() async {
    final birdMidFlip = await gameRef.loadSprite(Assets.birdMidFlip);
    final birdUpFlip = await gameRef.loadSprite(Assets.birdUpFlip);
    final birdDownFlip = await gameRef.loadSprite(Assets.birdDownFlip);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y/2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle : birdMidFlip,
      BirdMovement.up : birdUpFlip,
      BirdMovement.down : birdDownFlip
    };

    //add a circle hitbox around bird
    add(CircleHitbox());
  }

  //
  void fly(){
    add(
      MoveByEffect(
        Vector2(0, GameConfig.gravity), 
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      )
    );
    current = BirdMovement.up;
  }

  //update player movement 
  @override
  void update(double dt) {
    position.y += GameConfig.birdVelocity * dt;
    super.update(dt);
  }


  //
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // debugPrint('Collistion Detected');
    gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void resetGame(){
    position = Vector2(50, gameRef.size.y / 2 - size.y/2);
  }

  void gameOver(){
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
  }
}