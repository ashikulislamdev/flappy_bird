import 'dart:async';

import 'package:flame/game.dart';
import 'package:fleppy_bird/component/background.dart';
import 'package:fleppy_bird/component/ground.dart';

class FlappyBirdGame extends FlameGame{ //make the class which extends flamegame.
  @override
  FutureOr<void> onLoad() async {
    addAll([
      Background(), 
      Ground()
      ]
    );
    return super.onLoad();
  }
}