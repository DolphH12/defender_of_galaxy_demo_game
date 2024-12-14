import 'dart:async';

import 'package:defender_of_galaxies_game_demo/level_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  static Vector2 sceneSize = Vector2(400, 600);
  late CameraComponent cameraComponent;
  late LevelGame levelGame;

  @override
  FutureOr<void> onLoad() {
    levelGame = LevelGame();
    cameraComponent = CameraComponent.withFixedResolution(
      world: levelGame,
      width: sceneSize.x,
      height: sceneSize.y,
    );

    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    addAll([cameraComponent, levelGame]);
  }
}
