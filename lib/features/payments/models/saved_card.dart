import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_card.freezed.dart';
part 'saved_card.g.dart';

@freezed
class SavedCard with _$SavedCard {
  const factory SavedCard({
    required int id,
    required String documentId,
    required String paymentMethodId,
    required String brand,
    required String last4,
    required int expMonth,
    required int expYear,
    required bool isDefault,
  }) = _SavedCard;

  factory SavedCard.fromJson(Map<String, dynamic> json) =>
      _$SavedCardFromJson(json);

  // ✅ Strapi v4/v5 compatibility (v4 -> attributes, v5 -> flat)
  static SavedCard fromStrapiItem(Map<String, dynamic> item) {
    final attrs =
        (item['attributes'] is Map<String, dynamic>)
            ? (item['attributes'] as Map<String, dynamic>)
            : item;

    return SavedCard(
      id: (item['id'] ?? 0) as int,
      documentId: (item['documentId'] ?? '') as String,
      paymentMethodId: (attrs['paymentMethodId'] ?? '') as String,
      brand: (attrs['brand'] ?? '') as String,
      last4: (attrs['last4'] ?? '') as String,
      expMonth: (attrs['expMonth'] ?? 0) as int,
      expYear: (attrs['expYear'] ?? 0) as int,
      isDefault: (attrs['isDefault'] ?? false) as bool,
    );
  }
}
