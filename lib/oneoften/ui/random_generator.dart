import 'dart:math';
import 'dart:ui';

// todo 1. Singleton, 2. ServiceLocator
class RandomGenerator {
  final _random = new Random();

  /// return value in radians
  double nextRadius() {
    return _random.nextDouble() / 10 * ((_random.nextBool()) ? 1 : -1);
  }

  Color nextColor() {
    // todo randomized from predefined palette
    return Color.fromARGB(255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
  }
}
