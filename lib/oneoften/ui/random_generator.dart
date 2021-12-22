import 'dart:math';

class RandomGenerator {
  // todo ServiceLocator
  final random = new Random();

  /// return value in radians
  double nextRadius() {
    return random.nextDouble() / 10 * ((random.nextBool()) ? 1 : -1);
  }
}
