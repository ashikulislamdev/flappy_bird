import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:fleppy_bird/component/background.dart';
import 'package:fleppy_bird/component/bird.dart';
import 'package:fleppy_bird/component/ground.dart';
import 'package:fleppy_bird/component/pipe_group.dart';
import 'package:fleppy_bird/game/configeration.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{ //make the class which extends flamegame.
  FlappyBirdGame();

  late Bird bird;
  // TimerComponent interval = TimerComponent(period: GameConfig.pipeInterval, repeat: true);
  Timer interval = Timer(GameConfig.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  FutureOr<void> onLoad() async {
    addAll([
        Background(), 
        Ground(),
        bird = Bird(),
        score = buildScoring()
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
    score.text = 'Score : ${bird.score}'; //update the score
    super.update(dt);
  }

  TextComponent buildScoring(){
    return TextComponent(
      text: 'Score 0',
      position: Vector2(size.x/2, size.y/2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontFamily: 'GameFont'
        )
      )
    );
  }
}