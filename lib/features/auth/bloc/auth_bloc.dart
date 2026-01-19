import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUnauthenticated()) {
    on<LoginRequested>((event, emit) async {
      // Fake delay (API o‘rniga)
      await Future.delayed(const Duration(seconds: 1));

      emit(AuthAuthenticated(event.email));
    });

    on<LogoutRequested>((event, emit) {
      emit(AuthUnauthenticated());
    });
  }
}
