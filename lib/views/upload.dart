import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../controllers/video.dart';

class UploadForm extends StatefulWidget {
  final File file;
  final String path;

  const UploadForm({Key? key, required this.file, required this.path})
      : super(key: key);

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.file);
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
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(controller),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _songController,
            decoration: new InputDecoration(labelText: 'Song..'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: new InputDecoration(labelText: 'Description..'),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                _uploadVideoController.uploadVideo(_songController.text,
                    _descriptionController.text, widget.path);
              },
              child: Text('Publish'))
        ],
      ),
    ));
  }
}
