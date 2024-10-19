class ScannerEntity {
  final String id;
  final String isActive;

  ScannerEntity({
    required this.id,
    required this.isActive,
  });

  ScannerEntity copyWith({
    String? id,
    String? isActive,
  }) {
    return ScannerEntity(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
    );
  }
}
