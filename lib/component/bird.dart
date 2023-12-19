import 'dart:async';

import 'package:flame/components.dart';
import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/bird_movement.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>{
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
  }
}