abstract class Birth {
  DateTime date();
}

class Before implements Comparable<DateTime> {
  final DateTime date;

  Before(this.date);

  int order() {
    return -1;
  }

  @override
  int compareTo(DateTime other) {
    final isBefore = date.isBefore(other);
    return isBefore ? order() : After(other).order();
  }
}

class After implements Comparable<DateTime> {
  final DateTime date;

  After(this.date);

  int order() {
    return 1;
  }

  @override
  int compareTo(DateTime other) {
    final isAfter = date.isAfter(other);
    return isAfter ? order() : Before(other).order();
  }
}

class History {
  final List<Birth> items;

  History(this.items);

  List<T> ascendent<T>() {
    final sorted = [...items];
    sorted.sort((a, b) => Before(a.date()).compareTo(b.date()));

    return sorted.cast<T>();
  }

  List<T> descendent<T>() {
    final sorted = [...items];
    sorted.sort((a, b) => After(b.date()).compareTo(a.date()));

    return sorted.cast<T>();
  }
}
