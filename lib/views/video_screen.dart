import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/controllers/video_controller.dart';
import 'package:video_app/views/comment_screen.dart';
import 'package:video_app/widgets/circle_animation.dart';
import 'package:video_app/widgets/videoplayeritem.dart';

class VideoScreen extends StatelessWidget {
  final VideoController _videoController = Get.put(VideoController());

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
              ), // LinearGradient
              borderRadius: BorderRadius.circular(
                24,
              ), // BorderRadius.circular
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  24,
                ), // BorderRadius.circular
                child: Image.network(
                  profilePhoto,
                  fit: BoxFit.cover,
                ) // Image.network
                ), // ClipRRect
          ) // Container
        ],
      ), // Column
    ); // SizedBox
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView.builder(
          itemCount: _videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = _videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: data.videoUrl),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    // Column(
                    //   children: [
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(data.username,
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(data.caption,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Row(children: [
                                  Icon(
                                    Icons.music_note,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  Text(data.songName,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ])
                              ],
                            ),
                          ),
                        ),

                        Container(
                          width: 100,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 5,
                              left: 100.0), // EdgeInsets.only
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                      child: Icon(
                                    Icons.favorite,
                                    color: Colors.yellow,
                                    size: 40,
                                  )),
                                  Text(data.likes.length.toString(),
                                      style: TextStyle(color: Colors.amber))
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      child: Icon(
                                    Icons.reply,
                                    color: Colors.yellow,
                                    size: 40,
                                  )),
                                  Text(data.shareCount.toString(),
                                      style: TextStyle(color: Colors.amber))
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return CommentScreen(id: data.id);
                                        })); // Material PageRoute
                                      },
                                      child: Icon(
                                        Icons.comment,
                                        color: Colors.yellow,
                                        size: 40,
                                      )),
                                  Text(data.commentCount.toString(),
                                      style: TextStyle(color: Colors.amber))
                                ],
                              ),
                              CircleAnimation(
                                  child: buildMusicAlbum(data.profilePhoto))
                            ],
                          ), // Column
                        ) // Container
                      ],
                    )),
                  ],
                )
              ],
            );
            // ]);
          });
    })); // Scaffold
  }
}
