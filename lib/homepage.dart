import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/content.dart';
import 'package:message_app/members.dart';
import 'package:message_app/model.dart';

class HomePage extends StatefulWidget {
  final String? Pirates;
  HomePage({super.key, this.Pirates});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  int _current = 0;
  PirateModel crew = PirateModel();
  // List<Data> jsondata = [];

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
  List<String> Pirates = [
    "The Straw Hat Pirates",
    "The White Beard Pirates",
    "The Big Mom Pirates",
    "The Black Beard Pirates",
    "The Donquixote Family",
    "The Heart Pirates",
    "Red Haired Pirates",
    "The Roger Pirates",
    "The Beasts Pirates",
    "The Kid Pirates"
  ];
  List<String> Crew = [
    "Crew/Strawhat.jpg",
    "Crew/Whitebeard.jpg",
    "Crew/Bigmom.jpg",
    "Crew/Blackbeard.jpg",
    "Crew/Doflamingo.jpg",
    "Crew/law.jpg",
    "Crew/Redhaired.jpg",
    "Crew/Roger.jpg",
    "Crew/Kaido.jpg",
    "Crew/kid.jpg"
  ];
  List<String> flag = [
    "icons/straw.jpg",
    "icons/white.jpg",
    "icons/bigmom.jpg",
    "icons/black.jpg",
    "icons/doffy.jpg",
    "icons/law.jpg",
    "icons/shanks.jpg",
    "icons/roger.jpg",
    "icons/kaido.jpg",
    "icons/kid.jpg"
  ];
  // List<String> Name = [
  //   "Monkey.D.Luffy",
  //   "Roronoa Zoro",
  //   "Black Leg Sanji",
  //   "Doctor Chopper",
  //   "God Usopp",
  //   "Cyborg Franky",
  //   "Nico Robin",
  //   "Nami",
  //   "Soul King Brook",
  //   "Jinbe",
  // ];

  @override
  void initState() {
    super.initState();

    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => readJson());
    });
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data/data.json');
    final data = await json.decode(response);
    print("----------------->>>$data");
    crew = PirateModel.fromJson(data);
    print("--->>>>>>$crew");
// ...
    // crew = PirateModel.fromJson(data);

    // log(json.decode(crew.data))
    // var jsondata = crew[0].data![0].id;
    // print("--------------->$jsondata");
  }

  // readJson() async {
  //   final String response = await rootBundle.loadString('data/data.json');

  //   final data = await jsonDecode(response);
  //   print(data.runtimeType);
  //   print("--------------->$data");
  //   setState(() {
  //     print("Hello");
  //     crew = data['data'];
  //     print(crew.runtimeType);
  //     // var id = crew[0].id;
  //     // var jsondata = crew;
  //     List<dynamic> jsondataa = crew;
  //     print(jsondataa[0]['Members']);

  //     print("_____________>$jsondataa");
  //     // print(jsondata.runtimeType);
  //     print("--------------->$crew");

  //     // print("$id");
  //   });
  //   throw Exception();
  // }

  // Future<List<Data>> readJson() async {
  //   final jsondata = await rootBundle.loadString('data/data.json');
  //   print("Response-------------->$jsondata");
  //   print(jsondata.runtimeType);
  //   // log("${json.decode(jsondata)}");
  //   final data = await json.decode(jsondata);
  //   print("data--------------------->$data");
  //   print(data.runtimeType);
  //   print("hiiiii");

  //   print("List----------->$crew");
  //   print(crew.runtimeType);
  //   // crew = crew[0].id as List<Data>;
  //   // print("List----------------->$crew");
  //   return throw Exception();
  // }

  List<Widget> generateImagesTiles() {
    return Crew.map((Element) => ClipRRect(
          child: Image.asset(
            Element,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.0),
        )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 184, 12, 0),
          actions: <Widget>[
            IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.power_settings_new)),
            // Icon(Icons.power_settings_new),
            // TextButton(
            //   onPressed: () => FirebaseAuth.instance.signOut(),
            //   child: Text(
            //     'Logout',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        items: generateImagesTiles(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          // scrollDirection: Axis.vertical,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      Pirates[_current],
                      style: GoogleFonts.aclonica(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: Crew.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(flag[index]),
                                  radius: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  Pirates[index],
                                  style: GoogleFonts.castoro(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      log(jsonEncode(crew.data![index]));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home(
                                                  Title: Pirates[index],
                                                  crewdata:
                                                      crew.data![index])));
                                    },
                                    icon: Icon(Icons.arrow_right_sharp))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
