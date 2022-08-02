import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '/const.dart';
import '../models/comment.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get commentList => _comments.value;

  String _postId = '';

  updatePostId(String id) {
    _postId = id;
    getComments();
  }

  getComments() async {
    _comments.bindStream(
      firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .snapshots()
          .map(
        (QuerySnapshot query) {
          List<Comment> retValue = [];
          for (var element in query.docs) {
            retValue.add(Comment.fromSnap(element));
          }
          return retValue;
        },
      ),
    );
  }

  postComment(String commentText) async {
    try {
      print('aaaaaaaaa');
      print(commentText);
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection('users')
            .doc(authController.user.uid)
            .get();

        var allDocs = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();

        int len = allDocs.docs.length;

        Comment comment = Comment(
          username: (userDoc.data()! as dynamic)['name'],
          comment: commentText.trim(),
          datepublished: DateTime.now(),
          likes: [],
          profilePhoto: (userDoc.data()! as dynamic)['profilePhoto'],
          uid: authController.user.uid,
          id: 'Comment $len',
        ); // Comment

        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('comment $len')
            .set(comment.tojson());
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}
