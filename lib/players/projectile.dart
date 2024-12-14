import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Projectile extends SpriteComponent with CollisionCallbacks {
  final double speed = 200;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bullet.png');
    size = Vector2(20, 40);

    anchor = Anchor.center;

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y -= speed * dt;

    if (position.y < -size.y) {
      removeFromParent();
    }
  }
}
