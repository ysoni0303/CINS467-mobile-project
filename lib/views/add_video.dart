import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'upload.dart';

class AddVideoPage extends StatelessWidget {
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UploadForm(
          file: File(video.path),
          path: video.path,
        );
      }));
    }
  }

  showDialogOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: SimpleDialog(
              title: Text('Choose Option:'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: const Text('Gallery'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: const Text('Camera'),
                ),
              ],
              elevation: 10,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.upload),
            iconSize: 40,
            color: Colors.red,
            onPressed: () => showDialogOption(context)),
        Text('Upload Video')
      ],
    )));
  }
}
