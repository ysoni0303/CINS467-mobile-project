import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:timeago/timeago.dart' as timeago;
import 'package:video_app/const.dart';
import '../controllers/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  final String id;
  final TextEditingController _commentController = TextEditingController();
  final CommentController commentController = Get.put(CommentController());

  CommentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    commentController.updatePostId(id);

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: commentController.commentList.length,
                  itemBuilder: (context, index) {
                    final comments = commentController.commentList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(comments.profilePhoto),
                      ),
                      title: Row(
                        children: [
                          Text(
                            comments.username.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ), // TextStyle
                          ), // Text
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            comments.comment.toString(),
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            // timeago.format('100'),
                            '100',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            // '${comments.likes} likes',
                            '${comments.likes.length}, likes',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),

                      // trailing: InkWell(
                      //   onTap: () => commentController.likeComment(comments.id),
                      //   child: Icon(
                      //     Icons.favorite,
                      //     color:
                      //         comments.likes.contains(authController.user.uid)
                      //             ? Colors.red
                      //             : Colors.white,
                      //   ),
                      // ), // Icon
                      // Row // CircleAvatar
                    );
                  }); // ListTile
            })),

            Divider(),
            ListTile(
              title: TextFormField(
                controller: _commentController,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Comment',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              trailing: TextButton(
                onPressed: () {
                  commentController.postComment(_commentController.text);
                  _commentController.clear();
                },

                child: const Text(
                  'Publish',
                  style: TextStyle(
                    color: Colors.white,
                  ), // Text Style
                ), // Text
              ), // TextButton
            ), // ListTile

            // ListView.builder // Expanded
          ],
        ), // Column
      ), // SizedBox
    )); // SingleChildScrollView // Scaffold
  }
}
