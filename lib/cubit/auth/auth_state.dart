part of 'auth_cubit.dart';

class AuthState {
  final String token;

  bool get isLoggedIn => token.isNotEmpty;

  const AuthState({
    this.token = '',
  });

  AuthState copyWith({String? token}) {
    return AuthState(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  factory AuthState.fromJson(Map<String, dynamic> map) {
    return AuthState(
      token: map['token'],
    );
  }
}
