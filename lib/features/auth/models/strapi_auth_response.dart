class StrapiAuthResponse {
  factory StrapiAuthResponse.fromMap(Map<String, dynamic> map) {
    return StrapiAuthResponse(
      jwt: map['jwt'] as String,
      user: StrapiUser.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  StrapiAuthResponse({this.jwt, required this.user});

  final String? jwt;
  final StrapiUser user;
}

class StrapiUser {
  factory StrapiUser.fromMap(Map<String, dynamic> map) => StrapiUser(
    id: map['id'] as int,
    username: (map['username'] ?? '') as String,
    email: (map['email'] ?? '') as String,
    avatarUrl: _extractAvatarUrl(map['avatar']),
  );

  StrapiUser({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
  });

  final int id;
  final String username;
  final String email;

  final String? avatarUrl;

  static String? _extractAvatarUrl(dynamic avatar) {
    if (avatar == null) return null;

    if (avatar is Map && avatar['url'] is String) {
      return avatar['url'] as String;
    }

    if (avatar is Map &&
        avatar['data'] is Map &&
        (avatar['data'] as Map)['attributes'] is Map) {
      final attrs = (avatar['data'] as Map)['attributes'] as Map;
      if (attrs['url'] is String) return attrs['url'] as String;
    }

    return null;
  }
}
