import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
void main() async{
  runApp(const MyApp());
}

void saveProgress() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/progress.json');
  await file.writeAsString(jsonEncode(achievementDesc));
}

var template;
loadTemplate() async
{
  String response;
  response = await rootBundle.loadString("assets/Templates/template2.txt");
  template = jsonDecode(response);
  print(template["template"].length);
  await achievementDescLoad();
}


loadProgress() async {
  await loadTemplate();
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/progress.json');
  String read = await file.readAsString();

  final result = jsonDecode(read);
  /*for (int i = 0; i < achievementDesc.length; i++) {
    achievementDesc[achievementNames[i]]![1] = result[achievementNames[i]][1];
  }*/
}

List<String> achievementNames = [
  'Almost got me',
  'Amazing Loot',
  'Are you kidding me',
  'Armed to the teeth',
  'Awesome Loot',
  'Awesome Priest',
  'Back Pain',
  'Back well protected',
  'Break a leg',
  'Burning passion',
  'Busted',
  'Calculated',
  "Can't touch this",
  'Could always use a hand...',
  'Could never have too many, eh?',
  'Cube Master',
  'Double Crossed',
  'Double Handed Trouble',
  'Duty unfinished',
  'Expert Dice Roller',
  'Extra Shiny',
  'Flawless',
  'Full House',
  'Good Herald',
  'Good Loot',
  'Great Cleric',
  'Great Loot',
  'Hiding in the shadows',
  'How?',
  'Human Pinball',
  'I want it all',
  'Into the Fire',
  'Like a gust of wind',
  'Lucky Throw',
  'Makes my Head spin',
  'Master Wizard',
  'More than just help',
  "Ol' Reliable",
  'Old Friend',
  'Over the top',
  'Overencumbered with shinies',
  'Overkill',
  'PvP Skilled',
  'Soul Leakage',
  'Stone Wall',
  'Take this!',
  "That's it?",
  'The Dark Soul',
  'Treasures of War',
  'Unfair fight',
  'Unlucky Bastard',
  'Unsatisfied',
  "Wasn't in my plans",
  "Who's a Good Boy?"
];

Map<String, List> achievementDesc = {
  
};
achievementDescLoad()
{
  for(int i=0; i<template["template"].length; i++)
  {
    //final addition = template["template"][0]["name"];
    achievementDesc[template["template"][i]["name"]] = [template["template"][i]["desc"],template["template"][i]["finished"],template["template"][i]["type"]];
  }
  print(achievementDesc["Double Crossed"]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadProgress(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Main(),
                ));
          } else {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(body: CircularProgressIndicator()));
          }
        });
  }
}

bool complete = false;

class Main extends StatefulWidget {
  const Main({super.key});
 
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  /*@override
  void initState() {
    super.initState();
    waitLoad();
  }

  void waitLoad() async {
    await loadProgress();
  }*/
  @override
  Widget build(BuildContext context) {
    int howManyDone() {
      int count = 0;
      print(achievementNames[0]);
      print(achievementDesc[achievementNames[0]]);
      /*for (int i = 0; i < achievementNames.length; i++) {
        if (achievementDesc[achievementNames[i]]![1]) {
          count++;
        }
      }*/
      return count;
    }

    void sort(){
      if(complete){
        achievementNames.sort((a,b){
        String aValue = achievementDesc[a]![1].toString();
        String bValue = achievementDesc[b]![1].toString();
        return bValue.compareTo(aValue);
      });
      } else {
        achievementNames.sort((a,b){
        String aValue = achievementDesc[a]![1].toString();
        String bValue = achievementDesc[b]![1].toString();
        return aValue.compareTo(bValue);
      });
      }
      
    }

    void reset() async {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Reset All Achievement Progress?"),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < achievementDesc.length; i++) {
                          achievementDesc[achievementNames[i]]![1] = false;
                        }
                        saveProgress();
                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(
                      Icons.check,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                    ))
              ],
            );
          });
    }

    int done = howManyDone();
    return Column(children: [
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 48, 0, 10),
                child: Text(
                  "Achievements",
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Progress: $done / ${achievementNames.length}",
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                        icon: const Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            sort();
                            complete = !complete;
                          });
                        },
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              LinearProgressIndicator(
                value: done / achievementNames.length,
                minHeight: 10,
                valueColor: const AlwaysStoppedAnimation(Colors.black),
                backgroundColor: Colors.grey[900],
              ),
            ],
          ),
        ),
      ),
  
        
      Expanded(
          flex: 7,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image:DecorationImage(image: AssetImage("assets/wallpaper.jpg"),fit: BoxFit.fill,)
              
            ),
            child: ListView.builder(
              shrinkWrap: true,
              
              itemCount: achievementNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 0, 15, 15),
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              achievementNames[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 6, 0, 15),
                              child: Text(
                                achievementDesc[achievementNames[index]]![0],
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.white),
                            checkColor: Colors.red,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            value: achievementDesc[achievementNames[index]]![1],
                            onChanged: (bool? value) {
                              setState(() {
                                achievementDesc[achievementNames[index]]![1] =
                                    value;
                                saveProgress();
                              });
                            }),
                      )
                    ],
                  ),
            );
                      },
                    ),
          )),
    
    ]);
  }
}
