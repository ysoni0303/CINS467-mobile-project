import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_app/const.dart';
import 'package:get/get.dart';
import 'dart:io' as i;
import 'package:video_app/models/users.dart' as model;

import '../views/screens/auth/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<i.File?> _pickedImage;

  i.File? get profilePhoto => _pickedImage.value;

  void pickImage() async{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    Get.snackbar('Profile Photo', 'Congratulations');
  }

  _pickedImage = Rx<i.File?>(i.File(pickedImage!.path));




  }

  Future<String> _uploadImageToStorage(i.File image) async{
    Reference ref = firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUser(String username,String email,String password,i.File? image) async{
    try {
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null ){
         UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
         String downloadUrl = await _uploadImageToStorage(image);
         model.User user =  model.User(name: username, profilePhoto: downloadUrl, email: email, uid: cred.user!.uid);

         await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      }else{
        Get.snackbar('Error creating account', 'Please enter all details');
      }

    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

    void loginUser(String email,String password) async{
    try {
      if(email.isNotEmpty && password.isNotEmpty){
         await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          print('logged in already');
          Get.offAll(HomeScreen());
      }else{
        Get.snackbar('Error logging', 'Check details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}