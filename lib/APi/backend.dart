import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soultosoul/APi/pages.dart';

class Backend {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser =
        await _googleSignIn.signIn().catchError((onError) {
      print("Error $onError");
    });
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final FirebaseUser user = await _auth
          .signInWithCredential(GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ))
          .catchError((onError) {
        print("error $onError");
      });
      if (user != null) {
        print("signed in " + user.displayName);
        return user;
      }
    }
    return null;
  }
}

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Donor Details')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase(),)
        .getDocuments();
  }
}

class HSearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Hospital')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase(),)
        .getDocuments();
  }
}

