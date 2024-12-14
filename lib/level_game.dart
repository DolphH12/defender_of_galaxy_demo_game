import 'dart:async';
import 'dart:math';

import 'package:defender_of_galaxies_game_demo/enemies/enemy.dart';
import 'package:defender_of_galaxies_game_demo/main.dart';
import 'package:defender_of_galaxies_game_demo/players/player.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class LevelGame extends World {
  Random random = Random();
  double enemySpawnTimer = 0;

  @override
  Future<void> onLoad() async {
    Player player = Player();

    add(await loadParallaxComponent());
    add(player);
  }

  Future<ParallaxComponent> loadParallaxComponent() async {
    return ParallaxComponent.load(
      [
        ParallaxImageData('bg.png'),
        ParallaxImageData('Stars-B.png'),
        ParallaxImageData('Stars-A.png'),
      ],
      repeat: ImageRepeat.repeatY,
      baseVelocity: Vector2(0, -10),
      velocityMultiplierDelta: Vector2(1.0, 1.5),
      size: MyGame.sceneSize,
    );
  }

  void spawnEnemy() {
    final x = random.nextDouble() * (MyGame.sceneSize.x - 70);

    add(Enemy(position: Vector2(x, -70)));
  }

  @override
  void update(double dt) {
    super.update(dt);

    enemySpawnTimer += dt;

    if (enemySpawnTimer > 2) {
      spawnEnemy();
      enemySpawnTimer = 0;
    }
  }
}
