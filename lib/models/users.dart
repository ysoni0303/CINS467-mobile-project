import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;

  User(
      {required this.name,
      required this.profilePhoto,
      required this.email,
      required this.uid});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email ": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    print(snapshot);
    return User(
        name: snapshot['name'].toString(),
        profilePhoto: snapshot['profilePhoto'].toString(),
        email: snapshot['email'].toString(),
        uid: snapshot['uid'].toString());
  }
}
