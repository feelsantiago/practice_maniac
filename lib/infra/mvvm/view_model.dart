import 'dart:async';

abstract class ViewModel {
  /// This function is called once after widget been initialized
  ///
  /// You can return a [value], a [Future] or a [Stream]
  ///
  /// When a async operation is returned the app will show a [CircularProgressBar]
  FutureOr onInit() {}
  FutureOr onDispose() {}
  FutureOr onUpdate() {}
}
