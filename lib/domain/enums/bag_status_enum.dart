// ignore_for_file: constant_identifier_names

enum BagStatusEnum {
  STREETWISE,
  ON_THE_GO,
  DELIVERED,
  CANCELLED,
  RETURNED,
  RETURNED_DELIVERED,
  UNKNOWN,
}

extension BagStatusEnumExtension on BagStatusEnum {
  String toLiteral() {
    switch (this) {
      case BagStatusEnum.STREETWISE:
        return 'STREETWISE';
      case BagStatusEnum.ON_THE_GO:
        return 'ON_THE_GO';
      case BagStatusEnum.DELIVERED:
        return 'DELIVERED';
      case BagStatusEnum.CANCELLED:
        return 'CANCELLED';
      case BagStatusEnum.RETURNED:
        return 'RETURNED';
      case BagStatusEnum.RETURNED_DELIVERED:
        return 'RETURNED_DELIVERED';
      case BagStatusEnum.UNKNOWN:
        return 'UNKNOWN';
    }
  }
}
