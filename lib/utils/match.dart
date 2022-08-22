import 'package:practice_maniac/utils/types.dart';

import 'matcher.dart';

abstract class IMatch<T, V> {
  IMatch<T, V> match(Matcher<T> matcher, Factory<V> factory);
  List<MatchBranch> branches();
  V get();
}

class MatchBranch<T, V> implements Matcher<T> {
  final Matcher<T> matcher;
  final Factory<V> factory;

  MatchBranch(this.matcher, this.factory);

  @override
  bool match(T value) {
    return matcher.match(value);
  }

  V go() {
    return factory();
  }
}

class Match<T, V> implements IMatch<T, V> {
  final T value;
  final List<MatchBranch> _branches;

  const Match(this.value, [this._branches = const []]);

  @override
  List<MatchBranch> branches() {
    return _branches;
  }

  @override
  IMatch<T, V> match(Matcher<T> matcher, Factory<V> factory) {
    return Match<T, V>(value, [
      ...branches(),
      MatchBranch(matcher, factory),
    ]);
  }

  @override
  V get() {
    for (var branch in branches()) {
      if (branch.match(value)) {
        return branch.go();
      }
    }

    throw Exception('No match found!');
  }
}
