import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
import '../controllers/upload_video_controller.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;

  final TextEditingController _songNameController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });

    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final UploadVideoController _uploadVideoController =
      Get.put(UploadVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ), // Sized Box
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(controller),
          ),

          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _songNameController,
            decoration: InputDecoration(
              hintText: 'Song Name',
              border: OutlineInputBorder(),
            ),
          ),

          TextField(
            controller: _captionController,
            decoration: InputDecoration(
              hintText: 'Caption',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                _uploadVideoController.uploadVideo(_songNameController.text,
                    _captionController.text, widget.videoPath);
              },
              child: Text('Share'))
        ],
      ), // Column
    )); // SingleChildScrollView //
  }
}
