class Address {
  const Address({
    required this.id,
    required this.documentId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.addressLine,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.isDefault,
  });

  final int id;
  final String documentId;

  final String fullName;
  final String email;
  final String phone;
  final String addressLine;
  final String zipCode;
  final String city;
  final String country;

  final bool isDefault;

  Address copyWith({
    int? id,
    String? documentId,
    String? fullName,
    String? email,
    String? phone,
    String? addressLine,
    String? zipCode,
    String? city,
    String? country,
    bool? isDefault,
  }) {
    return Address(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      addressLine: addressLine ?? this.addressLine,
      zipCode: zipCode ?? this.zipCode,
      city: city ?? this.city,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  static int _asInt(dynamic v, {int fallback = 0}) {
    if (v == null) return fallback;
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v.toString()) ?? fallback;
  }

  static bool _asBool(dynamic v, {bool fallback = false}) {
    if (v == null) return fallback;
    if (v is bool) return v;
    if (v is num) return v != 0;
    final s = v.toString().toLowerCase().trim();
    if (s == 'true') return true;
    if (s == 'false') return false;
    return fallback;
  }

  static String _asString(dynamic v) => (v ?? '').toString();

  static Address fromStrapi(Map<String, dynamic> row) {
    final id = _asInt(row['id'], fallback: 0);

    final attrsRaw = row['attributes'];
    final attrs =
        (attrsRaw is Map ? attrsRaw.cast<String, dynamic>() : null) ??
        row.cast<String, dynamic>();

    final documentId = _asString(attrs['documentId'] ?? row['documentId']);
    if (documentId.isEmpty) {
      throw Exception(
        'Address: documentId is empty. In Strapi v5 use documentId for update/delete.',
      );
    }

    return Address(
      id: id,
      documentId: documentId,
      fullName: _asString(attrs['fullName']),
      email: _asString(attrs['email']),
      phone: _asString(attrs['phone']),
      addressLine: _asString(attrs['addressLine']),
      zipCode: _asString(attrs['zipCode']),
      city: _asString(attrs['city']),
      country: _asString(attrs['country']),
      isDefault: _asBool(attrs['isDefault'], fallback: false),
    );
  }
}
