import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Content extends StatefulWidget {
  final String? Title;
  final String? Intro;
  final Members? membersdata;

  Content({super.key, this.Title, this.Intro, this.membersdata});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  // late VideoPlayerController _controller;
  late FlickManager _flickManager;
  // final Uri _url =
  //     Uri.parse('https://onepiece.fandom.com/wiki/Monkey_D._Luffy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _launchUrl();
    _flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.asset(widget.Intro.toString()),
    );

    // _controller = VideoPlayerController.asset(widget.Intro.toString());

    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize().then((_) => setState(() {}));
    // _controller.play();
  }

  // Future<void> _launchUrl() async {
  //   print("---------------------->Hello");

  //   if (!await launchUrl(_url)) {
  //     print("-------------------->Hiiii");
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  @override
  void dispose() {
    // _controller.dispose();
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.Title.toString());
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   // automaticallyImplyLeading: false,
        //   titleSpacing: -10,
        //   // leading: IconButton(
        //   //     icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   //     onPressed: () async {
        //   //       Navigator.pop(
        //   //         context,
        //   //       );
        //   //     },
        //   //   ),
        //   title: Text(
        //     widget.Title.toString(),
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Container(
                child: FlickVideoPlayer(
                  flickManager: _flickManager,
                  flickVideoWithControls: FlickVideoWithControls(
                    closedCaptionTextStyle: TextStyle(fontSize: 8),
                    controls: FlickPortraitControls(),
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    controls: FlickLandscapeControls(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              // height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name :",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${widget.membersdata!.name}",
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description :",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            " ${widget.membersdata!.description}",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.alegreya(
                                textStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Role : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            " ${widget.membersdata!.role}",
                            style: GoogleFonts.alegreya(
                                textStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Origin : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${widget.membersdata!.origin}",
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bounty : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Image.asset("icons/Beli.png"),
                        Text(
                          " ${widget.membersdata!.bounty}",
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Devil Fruit : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${widget.membersdata!.devilFruit}",
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Type : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${widget.membersdata!.type}",
                          style: GoogleFonts.alegreya(
                              textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ability : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            " ${widget.membersdata!.ability}",
                            style: GoogleFonts.alegreya(
                                textStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Haki : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.membersdata!.haki}",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.alegreya(
                                textStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
