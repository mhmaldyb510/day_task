import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignUpLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user?.updateProfile(displayName: name);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .collection('tasks')
          .doc()
          .set({});

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(e.message!));
    }
  }

  void holding() {
    emit(SignUpLoading());
  }
  void unHolding() {
    emit(SignUpInitial());
  }
}
