import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  void logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LogInSuccess());
    } catch (e) {
      emit(LogInFailure(e.toString()));
    }
  }
  void holding() {
    emit(LogInLoading());
  }
  void unHolding() {
    emit(LogInInitial());
  }
}
