import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_task/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<List<TaskModel>> getTasks() async {
  final tasks = await FirebaseFirestore.instance.collection('tasks').get();
  return tasks.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
}

Future<void> addTask(TaskModel task) async {
  await FirebaseFirestore.instance.collection('tasks').add(task.toJson());
}

Future<void> updateTask(TaskModel task) async {
  await FirebaseFirestore.instance
      .collection('tasks')
      .doc(task.id)
      .update(task.toJson());
}

Future<void> deleteTask(TaskModel task) async {
  await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
}

Future<void> addCollaborator(TaskModel task, String collaborator) async {
  await FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
    'collaborators': FieldValue.arrayUnion([collaborator])
  });
}

Future<void> removeCollaborator(TaskModel task, String collaborator) async {
  await FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
    'collaborators': FieldValue.arrayRemove([collaborator])
  });
}

Future<UserCredential> continueWithGoogle() async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    await user.user?.updateProfile(displayName: googleUser?.displayName);

    if (await isNewUser(user.user!.uid)) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.user?.uid)
          .collection('tasks')
          .doc()
          .set({});
    }

    // Once signed in, return the UserCredential
    return user;
  } on Exception catch (e) {
    return Future.error(e.toString());
  }
}

Future<bool> isNewUser(String uid) async {
  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    log(userDoc.exists.toString());

    return !userDoc.exists;
  } catch (e) {
    return true; // Assume new user in case of error
  }
}
