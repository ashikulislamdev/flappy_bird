import 'dart:async';

import 'package:flame/game.dart';
import 'package:fleppy_bird/component/background.dart';
import 'package:fleppy_bird/component/bird.dart';
import 'package:fleppy_bird/component/ground.dart';
import 'package:fleppy_bird/component/pipe_group.dart';

class FlappyBirdGame extends FlameGame{ //make the class which extends flamegame.
  late Bird bird;
  @override
  FutureOr<void> onLoad() async {
    addAll([
        Background(), 
        Ground(),
        bird = Bird(),
        PipeGroup()
      ]
    );
    return super.onLoad();
  }
}