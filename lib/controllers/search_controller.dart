import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_app/const.dart';
import 'package:video_app/models/users.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    print('1');
    print(typedUser);
    _searchedUsers.bindStream(firestore
        .collection('users')
        .where('name', isEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> retVal = [];
      for (var elem in query.docs) {
        print('2');
        retVal.add(User.fromSnap(elem));
      }
      print('3');
      print(retVal);
      return retVal;
    }));
  }
}
