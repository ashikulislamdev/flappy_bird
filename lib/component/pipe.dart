import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fleppy_bird/game/assets.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:fleppy_bird/game/pipe_position.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame>{

  Pipe({required this.height, required this.pipePosition});
  @override
  final double height;
  final PipePosition pipePosition;


  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotate);

    size = Vector2(50, height);

    //set pipePosition
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - GameConfig.groundHight;
        sprite = Sprite(pipe);
        break;
    }
  }
}