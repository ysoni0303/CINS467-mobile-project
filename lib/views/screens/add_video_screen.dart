import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_app/const.dart';
import 'package:video_app/views/screens/confirm_screen.dart';
import 'dart:io';

class AddVideoScreen extends StatelessWidget {
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ConfirmScreen(
          videoFile: File(video.path),
          videoPath: video.path,
        );
      }));
    }
  }

  showDialogOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
              SimpleDialogOption(
                onPressed: () => pickVideo(ImageSource.gallery, context),
                child: Row(
                  children: [
                    Icon(Icons.image),
                    Text(
                      'Gallery',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ), // Row
              ), // SimpleDialogOption

              SimpleDialogOption(
                onPressed: () => pickVideo(ImageSource.camera, context),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Text(
                      'Camera',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ), // Row
              ), // SimpleDialogOption

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.cancel),
                    Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ), // Row
              ) // SimpleDialogOption
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
                onTap: () => showDialogOption(context),
                child: Container(
                    decoration: BoxDecoration(
                      color: buttonColor,
                    ), // BoxDecoration
                    width: 190,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Add Video',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ))))); // Scaffold
  }
}
