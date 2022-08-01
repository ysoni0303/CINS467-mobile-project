import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/controllers/video_controller.dart';
import 'package:video_app/widgets/videoplayeritem.dart';

class VideoScreen extends StatelessWidget {
  final VideoController _videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView.builder(
          itemCount: _videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = _videoController.videoList[index];
            return Stack(children: [
              VideoPlayerItem(videoUrl: data.videoUrl),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(data.username,
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(data.caption,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Row(children: [
                                    Icon(
                                      Icons.music_note,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(data.songName,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
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
                            ), // EdgeInsets.only
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
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
                                      color: Colors.red,
                                      size: 20,
                                    )),
                                    Text(data.shareCount.toString(),
                                        style: TextStyle(color: Colors.amber))
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        child: Icon(
                                      Icons.comment,
                                      color: Colors.red,
                                      size: 20,
                                    )),
                                    Text(data.commentCount.toString(),
                                        style: TextStyle(color: Colors.amber))
                                  ],
                                ),
                              ],
                            ), // Column
                          ) // Container
                        ],
                      )),
                    ],
                  )
                ],
              )
            ]);
          });
    })); // Scaffold
  }
}
