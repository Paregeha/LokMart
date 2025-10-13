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
    username: map['username'] as String,
    email: map['email'] as String,
  );

  StrapiUser({required this.id, required this.username, required this.email});

  final int id;
  final String username;
  final String email;
}
