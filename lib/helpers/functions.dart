import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

int getDaysInMonth(int year, int month) {
  // Returns the number of days in the specified month of a given year.
//
// The function calculates the last day of the specified month by
// determining the day before the first day of the following month.
// Handles the transition between December and January correctly.
//
// [year] The year as a four-digit integer.
// [month] The month as an integer from 1 (January) to 12 (December).
//
// Returns the number of days in the specified month.

  // If the month is December, the next month is January of the next year
  int nextMonth = month == 12 ? 1 : month + 1;
  int nextMonthYear = month == 12 ? year + 1 : year;

  // The last day of the current month is the day before the first day of the next month
  DateTime firstDayNextMonth = DateTime(nextMonthYear, nextMonth, 1);
  DateTime lastDayCurrentMonth =
      firstDayNextMonth.subtract(const Duration(days: 1));

  return lastDayCurrentMonth.day;
}

Future<UserCredential> signInWithGoogle() async {
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
  // Once signed in, return the UserCredential
  return user;
} on Exception catch (e) {
  return Future.error(e.toString());
}
}
