import 'package:practice_maniac/utils/types.dart';

import 'match.dart';
import 'matcher.dart';

abstract class ISelect<T> {
  ISelect<T> truthy(Factory<T> factory);
  ISelect<T> falsy(Factory<T> factory);
  T get();
}

class Select<T> implements ISelect<T> {
  final bool value;
  final IMatch<bool, T> _match;

  Select(this.value, {List<MatchBranch> branches = const []})
      : _match = Match<bool, T>(value, branches);

  @override
  ISelect<T> truthy(Factory<T> factory) {
    return Select(
      value,
      branches: [
        ..._match.branches(),
        MatchBranch(True(), factory),
      ],
    );
  }

  @override
  ISelect<T> falsy(Factory<T> factory) {
    return Select(
      value,
      branches: [
        ..._match.branches(),
        MatchBranch(False(), factory),
      ],
    );
  }

  @override
  T get() {
    return _match.get();
  }
}

class BranchMatcher {}
