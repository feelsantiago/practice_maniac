class Progress {
  final String id;
  final String value;
  late final DateTime date;

  Progress({
    required this.id,
    required this.value,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
