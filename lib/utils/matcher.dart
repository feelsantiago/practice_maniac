abstract class Matcher<T> {
  bool match(T value);
}

class True implements Matcher<bool> {
  @override
  bool match(bool value) {
    return value == true;
  }
}

class False implements Matcher<bool> {
  @override
  bool match(bool value) {
    return value == false;
  }
}

class Any implements Matcher<bool> {
  @override
  bool match(bool value) {
    return true;
  }
}
