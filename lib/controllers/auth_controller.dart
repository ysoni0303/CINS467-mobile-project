import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_app/const.dart';
import 'package:get/get.dart';
import 'dart:io' as i;
import 'package:video_app/models/users.dart' as model;
import 'package:video_app/views/login_page.dart';
import '../views/home_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<i.File?> _pickedImage;
  late Rx<User?> _user;

  i.File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialState);
  }

  _setInitialState(User? user) {
    if (user == null) {
      Get.offAll(LoginPage());
    } else {
      Get.offAll(HomePage());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Get.snackbar('Profile Photo', 'Congratulations');
    }

    _pickedImage = Rx<i.File?>(i.File(pickedImage!.path));
  }

  Future<String> _uploadImageToStorage(i.File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUser(
      String username, String email, String password, i.File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadImageToStorage(image);
        model.User user = model.User(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);

        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error creating account', 'Please enter all details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('logged in already');
        Get.offAll(HomePage());
      } else {
        Get.snackbar('Error logging', 'Check details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
