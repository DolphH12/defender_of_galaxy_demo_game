import 'dart:async';

import 'package:defender_of_galaxies_game_demo/main.dart';
import 'package:defender_of_galaxies_game_demo/players/projectile.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent with KeyboardHandler {
  final double speed = 200;
  Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('SpaceShip.png');
    anchor = Anchor.center;
    position = Vector2(MyGame.sceneSize.x / 2, MyGame.sceneSize.y - 70);
    size = Vector2.all(70);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocity = Vector2.zero();

    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -200;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = 200;
    }
    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      shoot();
    }
    return super.onKeyEvent(event, keysPressed);
  }

  void shoot() {
    final projectile = Projectile()..position = Vector2(position.x, position.y);
    parent?.add(projectile);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;

    position.clamp(
      Vector2(
        size.x / 2,
        position.y,
      ),
      Vector2(
        MyGame.sceneSize.x - size.x / 2,
        position.y,
      ),
    );
  }
}
