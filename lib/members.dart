import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/content.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/content.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:message_app/model.dart';

class Home extends StatefulWidget {
  final String? Title;
  final String? Intro;
  final String? Voice;
  final String? Pirates;
  final List<String>? Name;
  Data crewdata;
  Home({
    super.key,
    this.Title,
    this.Intro,
    this.Voice,
    this.Pirates,
    this.Name,
    required this.crewdata,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> Voice = [
  //   "voice/luffy.mp3",
  //   "voice/zoro.mp3",
  // ];
  List<String> Intro = [
    "onepiece/Luffy.mp4",
    "onepiece/Zoro.mp4",
    "onepiece/sanji.mp4",
    "onepiece/zoro1.mp4",
    "onepiece/usopp.mp4",
    "onepiece/franky.mp4",
    "onepiece/luffy.mp4",
    "onepiece/Luffy.mp4",
    "onepiece/brook.mp4",
    "onepiece/Luffy.mp4",
  ];
  // List<String> Characters = [
  //   "characters/luffy.png",
  //   "characters/zoro.png",
  //   "characters/sanji.png",
  //   "characters/chopper.png",
  //   "characters/usopp.png",
  //   "characters/franky.png",
  //   "characters/robin.png",
  //   "characters/nami.png",
  //   "characters/brook.png",
  //   "characters/jinbe.png",
  //   // "characters/nami.png",
  // ];

  // Audio Player

  // bool isplaying = false;
  // bool audioplayed = false;
  // late Uint8List audiobytes;

  // AudioPlayer player = AudioPlayer();
  // @override
  // void initState() {
  //   setState(() {});
  //   super.initState();
  // }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    print("------------>${widget.crewdata.members}");
    
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        titleSpacing: -10,
        // leading: IconButton(
        //     icon: const Icon(Icons.arrow_back, color: Colors.white),
        //     onPressed: () async {
        //       Navigator.pop(
        //         context,
        //       );
        //     },
        //   ),
        title: Text(
          widget.Title.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
              itemCount: widget.crewdata.members?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Content(
                                  Title: widget.crewdata.members![index].name
                                      .toString(),
                                  Intro: Intro[index],
                                  membersdata: widget.crewdata.members![index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        Flexible(
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 4,
                            child: Image.asset(
                              widget.crewdata.members![index].image.toString(),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.crewdata.members![index].name.toString(),
                          // widget.Name![index].toString(),
                              style: GoogleFonts.aclonica(
                                  textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    ));
  }
}
