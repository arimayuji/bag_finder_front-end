class TripEntity {
  final String id;
  final String description;
  final DateTime time;

  TripEntity({
    required this.id,
    required this.description,
    required this.time,
  });

  TripEntity copyWith({
    String? id,
    String? description,
    DateTime? time,
  }) {
    return TripEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      time: time ?? this.time,
    );
  }

  static TripEntity empty() {
    return TripEntity(
      id: '',
      description: '',
      time: DateTime.now(),
    );
  }
}
