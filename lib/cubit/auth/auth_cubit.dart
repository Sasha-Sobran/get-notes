import 'package:frontendik/locator/locator.dart';
import 'package:frontendik/router/router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void saveUserToken(String? token) async {
    if (token == null) return;

    emit(state.copyWith(token: token));
  }

  void logout() async {
    await HydratedBloc.storage.clear();
    emit(const AuthState());
    getIt<AppRouter>().goRouter.go('/');
  }

  @override
  Map<String, dynamic> toJson(AuthState state) => state.toJson();

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    try {
      return AuthState.fromJson(json);
    } catch (_) {}
    return const AuthState();
  }
}
