import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_app/const.dart';
import 'package:video_app/views/confirm_screen.dart';
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
        builder: (BuildContext context) {
          return Expanded(
            child: SimpleDialog(
              title: Text('Choose Option:'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: const Text('Camera'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: const Text('Gallery'),
                ),
              ],
              elevation: 10,
              //backgroundColor: Colors.green,
            ),
          );

          // builder: (context) => SimpleDialog(children: [
          //       SimpleDialogOption(
          //         onPressed: () => pickVideo(ImageSource.gallery, context),
          //         child: Row(
          //           children: [
          //             Icon(Icons.image),
          //             Text(
          //               'Gallery',
          //               style:
          //                   TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //             )
          //           ],
          //         ), // Row
          //       ), // SimpleDialogOption

          //       SimpleDialogOption(
          //         onPressed: () => pickVideo(ImageSource.camera, context),
          //         child: Row(
          //           children: [
          //             Icon(Icons.camera_alt_outlined),
          //             Text(
          //               'Camera',
          //               style:
          //                   TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //             )
          //           ],
          //         ), // Row
          //       ), // SimpleDialogOption

          //       SimpleDialogOption(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: Row(
          //           children: [
          //             Icon(Icons.cancel),
          //             Text(
          //               'Cancel',
          //               style:
          //                   TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //             )
          //           ],
          //         ), // Row
          //       ) // SimpleDialogOption
          //     ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            //     child: InkWell(
            //       onTap: () => showDialogOption(context),
            //       child: Container(
            //         width: 190,
            //         height: 50,
            //         decoration: BoxDecoration(color: buttonColor),
            //         child: const Center(
            //           child: Text(
            //             'Upload Video',
            //             style: TextStyle(
            //               fontSize: 20,
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // );

            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.upload),
            iconSize: 50,
            color: Colors.brown,
            tooltip: 'Increase volume by 5',
            onPressed: () => showDialogOption(context)),
        Text('Upload Video')
      ],
    )));
  }
}
