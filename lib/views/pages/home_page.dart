import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController topTextController = TextEditingController();
  final TextEditingController bottomTextController = TextEditingController();
  RxString memeUrl = ''.obs;
 RxString memeName = "10-Guy".obs;

  void generateMeme() {
  
      memeUrl.value =
          'https://apimeme.com/meme?meme=${memeName.value}&top=${Uri.encodeComponent(topTextController.text)}&bottom=${Uri.encodeComponent(bottomTextController.text)}';
 
  }

  final List<String> memeOptions = [
    "10-Guy",
    "1950s-Middle-Finger",
    "1990s-First-World-Problems",
    "1st-World-Canadian-Problems",
    "2nd-Term-Obama",
    "Aaaaand-Its-Gone",
    "Ace-Primo",
    "Actual-Advice-Mallard",
    "Adalia-Rose",
    "Admiral-Ackbar-Relationship-Expert",
    "Advice-Dog",
    "Advice-Doge",
    "Advice-God",
    "Advice-Peeta",
    "Advice-Tam",
    "Advice-Yoda",
    "Afraid-To-Ask-Andy",
    "Afraid-To-Ask-Andy-Closeup",
    "Aint-Nobody-Got-Time-For-That",
    "Alan-Greenspan",
    "Alarm-Clock",
    "Albert-Cagestein",
    "Albert-Einstein-1",
    "Alien-Meeting-Suggestion",
    "Alright-Gentlemen-We-Need-A-New-Idea",
    "Always-Has-Been",
    "Alyssa-Silent-Hill",
    "Am-I-The-Only-One-Around-Here",
    "American-Chopper-Argument",
    "Ancient-Aliens",
    "And-everybody-loses-their-minds",
    "And-then-I-said-Obama",
    "Angry-Asian",
    "Angry-Baby",
    "Angry-Birds-Pig",
    "Angry-Bride",
    "Angry-Chef-Gordon-Ramsay",
    "Angry-Chicken-Boss",
    "Angry-Dumbledore",
    "Angry-Koala",
    "Angry-Rant-Randy",
    "Angry-Toddler",
    "Annoying-Childhood-Friend",
    "Annoying-Facebook-Girl",
    "Anri-Stares",
    "Anti-Joke-Chicken",
    "Apathetic-Xbox-Laser",
    "Archer",
    "confession-kid"
  ];

  @override
  Widget build(BuildContext context) {
    print(
      "rebuild"
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Meme Gen App'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: topTextController,
                decoration: InputDecoration(
                  hintText: "Enter top text",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: bottomTextController,
                decoration: InputDecoration(
                  hintText: "Enter bottom text",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                 () {
                  return DropdownButton<String>(
                    value: memeName.value,
                    underline: Container(),
                    hint: Text('Select a meme'),
                    onChanged: (String? newValue) {
                     
                        memeName.value = newValue ?? memeName.value;
                       
                   
                    },
                    items: memeOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: generateMeme,
                child: Text('Generate Meme'),
              ),
              SizedBox(height: 20),
              
                Obx(
                  () {if (memeUrl.isNotEmpty)
                    return Image.network(
                      memeUrl.value,
                      key: ValueKey(memeUrl),
                      height: 200,
                    );
                    else return Container();
                  }
                ),
            ],
          ),
        ),
      ),
    );
  }
}
