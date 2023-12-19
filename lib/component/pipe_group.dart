import 'dart:async';

import 'package:flame/components.dart';
import 'package:fleppy_bird/component/pipe.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:fleppy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100),
      Pipe(pipePosition: PipePosition.bottom, height: 200),
    ]);
  }

  //to set the random height to the pipe
  @override
  void update(double dt) {
    //update the position of the pipe 
    position.x -= GameConfig.gameSpead * dt; //delta time * specific game speeed
    super.update(dt);
  }
}