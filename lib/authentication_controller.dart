import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Below is controller that i will inject into my
// UI for authentication.
class AuthController extends GetxController {
  //  In order to implement logic for google sign-in
  //  I have to initialize 2 instances as:
  FirebaseAuth auth = FirebaseAuth.instance;
  //  Second is google-signIn instance as:
  GoogleSignIn googleSignIn = GoogleSignIn();

  //  Below i am creating reactive user for my app if the
  //  user is already login & come back to my app then I
  //  want to navigate user to homeScreen of app instead
  //  of asking user to login again & again.
  Rx<User?> user = Rx<User?>(
    //  Now, inside here I must have to povide some info
    //  related to user therefore;
    FirebaseAuth.instance.currentUser,
  );

  //  Below is the function taht work same as
  //  init() function of my widget meaning it
  //  will be executed when controller get called
  //  for the first time.
  @override
  void onInit() {
    //  Below I'm binding the stream to my reactive user
    //  i defined above.
    user.bindStream(auth.authStateChanges());
    super.onInit();
  }

  //  Following function sign-in the user based on google account
  //  info of user.
  login() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      //  Below I am getting user credentials as:
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      //  Now after authenticating the user I will get the user
      //  credentials as:
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      //  So when user completely sign in then I will collect user
      //  credentials.
      User? user = userCredential.user!;
      userCollection.doc(user.uid).set({
        "username": user.displayName,
        "profilepic": user.photoURL,
        "email": user.email,
        "uid": user.uid,
        "userCreated": DateTime.now(),
      });
    }
    //  With above if we have signed in user into our app but
    //  what I want to implement is that I want to store user
    //  info inside my FireStore after user signed-in.
  }
}
