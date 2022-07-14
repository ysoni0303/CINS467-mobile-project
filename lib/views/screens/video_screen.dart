import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Stack(
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
                                  Text('Username',
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('Caption',
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
                                    Text('Song Name',
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
                              children: [CircleAvatar(
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
                                )
                              ),
                              Text('200 likes', style: TextStyle(color: Colors.amber))
                                ],
                              ),

                                                            Column(
                                children: [
                                  InkWell(
                                child: Icon(
                                  Icons.reply,
                                  color: Colors.red,
                                  size: 20,
                                )
                              ),
                              Text('200 shares', style: TextStyle(color: Colors.amber))
                                ],
                              ),

                                                            Column(
                                children: [
                                  InkWell(
                                child: Icon(
                                  Icons.comment,
                                  color: Colors.red,
                                  size: 20,
                                )
                              ),
                              Text('200 comments', style: TextStyle(color: Colors.amber))
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
              );
            })); // Scaffold
  }
}
