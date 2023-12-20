import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:fleppy_bird/component/pipe.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:fleppy_bird/game/flappy_bird.dart';
import 'package:fleppy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();

  final _random = Random();

  @override
  FutureOr<void> onLoad() async {
    //define the height or ...
    position.x = gameRef.size.x;

    //define height of the screen without the ground height
    final heightWithoutGround = gameRef.size.y - GameConfig.groundHight;
    //define the space between top and bottom pipe
    final spacing = 100 + _random.nextDouble() * (heightWithoutGround / 4);
    //define the center of the screen
    final centerY = spacing + _random.nextDouble() * (heightWithoutGround - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightWithoutGround - (centerY + spacing / 2)),
    ]);
  }

  //to set the random height to the pipe
  @override
  void update(double dt) {
    //update the position of the pipe 
    position.x -= GameConfig.gameSpead * dt; //delta time * specific game speeed
    
    //to remove stack up to effect the game performance(when it'll out of the screen)
    if (position.x < -10) {
      removeFromParent();
      //update the score when it's pass the screen
      updateScore();
    }

    //after game over remove all the pipe and start new
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }

    super.update(dt);
  }
  
  void updateScore(){
    gameRef.bird.score += 1;  
  }

}