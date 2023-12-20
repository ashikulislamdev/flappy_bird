import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:fleppy_bird/component/background.dart';
import 'package:fleppy_bird/component/bird.dart';
import 'package:fleppy_bird/component/ground.dart';
import 'package:fleppy_bird/component/pipe_group.dart';
import 'package:fleppy_bird/game/configeration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{ //make the class which extends flamegame.
  FlappyBirdGame();

  late Bird bird;
  // TimerComponent interval = TimerComponent(period: GameConfig.pipeInterval, repeat: true);
  Timer interval = Timer(GameConfig.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  FutureOr<void> onLoad() async {
    addAll([
        Background(), 
        Ground(),
        bird = Bird(),
      ]
    );

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }
}