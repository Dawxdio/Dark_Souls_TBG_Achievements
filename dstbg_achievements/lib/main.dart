import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

void save() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/progress.json');
  await file.writeAsString(jsonEncode(achievementDesc));
}

load() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/progress.json');
  String read = await file.readAsString();
  print(read);
  final result = jsonDecode(read);
  for (int i = 0; i < achievementDesc.length; i++) {
    achievementDesc[achievementNames[i]]![1] = result[achievementNames[i]][1];
  }
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
  "Double Crossed": [
    "Defeat a room with an encounter with two sentinels.",
    false
    ,"Base Game"
  ],
  "Human Pinball": [
    "Get Pushed 3 times in a row during single enemies Attacks",
    false, "Base Game"
  ],
  "Into the Fire": [
    "Defeat 3 enemies standing in the same node with a single attack at once",
    false, "Base Game"
  ],
  "Are you kidding me": ["Roll 4 Black Dies with a total equal of 0", false, "Base Game"],
  "Overkill": ["Deal 8 or more damage in one attack", false, "Base Game"],
  "Extra Shiny": ["Recieve a total of 3 or more Souls from Barrels", false, "Base Game"],
  "Can't touch this": [
    "Finish an encounter with just one Dodge Chance and Dodging at least one of every enemy during that encounter.",
    false, "Base Game"
  ],
  "Over the top": ["Max out all of the Statistics at once", false, "Base Game"],
  "Stone Wall": ["Finish an encounter without moving once.", false, "Base Game"],
  "Cube Master": ["Throw 10 or more Dies during one activation", false, "Base Game"],
  "Lucky Throw": [
    "Reroll an Orange Die that was equal to one, to an Orange Die that is equal to 4.",
    false, "Base Game"
  ],
  "Unlucky Bastard": ["Buy Reroll During one Spark 3 Times", false, "Base Game"],
  "Busted": [
    "Get Defeated after your first activtion during an encounter",
    false, "Base Game"
  ],
  "Calculated": [
    "Finish an encounter With 10 Cubes worth of Condition and/or Health.",
    false, "Base Game"
  ],
  "Back Pain": [
    "Deal An Extra 2 damage from A Black Die that came from Boss Weakpoint",
    false, "Base Game"
  ],
  "Who's a Good Boy?": ["Defeat Sif using only Clubs", false, "Darkroot"],
  "Wasn't in my plans": [
    "Get pushed into a trap and recieve damage from it.",
    false, "Base Game"
  ],
  "Soul Leakage": ["Get pushed into a Barrel, breaking it", false, "Base Game"],
  "Hiding in the shadows": [
    "Be out of range of an attack that have 2 or more range two times in a row",
    false, "Base Game"
  ],
  "PvP Skilled": [
    "Dodge an attack from an invader that requires 3 or more Dodge Requirement.",
    false, "Phantoms"
  ],
  "Treasures of War": [
    "Equip and Use at least once piece of equipment from An Invader.",
    false, "Phantoms"
  ],
  "Unfair fight": ["Die from an enemy while An Invader is present", false, "Phantoms"],
  "Take this!": ["Defeat an Invader", false, "Phantoms"],
  "Burning passion": [
    "Defeat An Invader with a magic attack that dealt 3 or more damage over the remaining Invaders health",
    false, "Phantoms"
  ],
  "Break a leg": ["Dodge Marvelous Chester Kick Attack", false, "Phantoms"],
  "Good Herald": [
    "Heal two cube worth of Condition and/or Health from one character at once (Estus Doesn't Count)",
    false, "Base Game"
  ],
  "Great Cleric": [
    "Heal six cube worth of Condition and/or Health from one character at once (Estus Doesn't Count)",
    false, "Base Game"
  ],
  "Awesome Priest": [
    "Heal eight cube worth of Condition and/or Health from one character at once (Estus Doesn't Count)",
    false, "Base Game"
  ],
  "Could always use a hand...": [
    "Summon friendly ghost to aid you in battle.",
    false, "Phantoms"
  ],
  "More than just help": [
    "Let Friendly Ghost deal the finishing blow to the Enemy.",
    false, "Phantoms"
  ],
  "Duty unfinished": [
    "Get Defeated while a Friendly Ghost is still alive.",
    false, "Phantoms"
  ],
  "Old Friend": ["Summon Solaire of Astora", false, "Phantoms"],
  "Back well protected": [
    "Equip a shield and a double handed weapon at the same time and use them until next Spark",
    false, "Base Game"
  ],
  "Double Handed Trouble": [
    "Equip two weapons at the same time and use them until next Spark",
    false, "Base Game"
  ],
  "Like a gust of wind": [
    "Have a total of 5 or more Green Dies total of Dodge Chance",
    false, "Base Game"
  ],
  "Armed to the teeth": [
    "Have a total of 2 or more Orange Dies as one of the Defenses",
    false, "Base Game"
  ],
  "Overencumbered with shinies": [
    "Have all the equipment slots filled with rings, weapons, weapon upgrades and armors that are possible (12 total)",
    false, "Base Game"
  ],
  "Could never have too many, eh?": [
    "Have at least 10 rings and weapon upgrades in inventory at the same time",
    false, "Base Game"
  ],
  "Makes my Head spin": [
    "Make enemy have 3 different debuffs at the same time",
    false, "Base Game"
  ],
  "That's it?": ["finish an encounter within 3 activations", false, "Base Game"],
  "Unsatisfied": ["Change Shops 3 time without buying anything", false, "Base Game"],
  "I want it all": ["Buy all four items from one shop", false, "Base Game"],
  "Good Loot": [
    "Equip a piece of equipment found in a chest and use it at least once",
    false, "Base Game"
  ],
  "Great Loot": [
    "Equip a piece of equipment acquired from a shop and use it at least once",
    false, "Base Game"
  ],
  "Awesome Loot": [
    "Equip a Minibosses piece of equipment and use it at least once",
    false, "Base Game"
  ],
  "Amazing Loot": [
    "Equip a Transposed piece of equipment and use it at least once",
    false, "Base Game"
  ],
  "Almost got me": [
    "Finish a trapped Encounter Dodging At least 4 Traps",
    false, "Base Game"
  ],
  "Flawless": ["Complete the game without dying", false, "Base Game"],
  "Full House": [
    "Defeat all encounters in a dungeon (except the boss) during one spark",
    false, "Base Game"
  ],
  "Ol' Reliable": ["Complete the game dealing only physical damage", false, "Base Game"],
  "Master Wizard": ["Complete the game dealing only magic damage", false, "Base Game"],
  "Expert Dice Roller": ["Defeat a miniboss without using any sparks", false, "Base Game"],
  "How?": ["Complete the game without using any sparks", false, "Base Game"],
  "The Dark Soul": ["Complete all achievements", false, "Base Game"],
};

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    waitLoad();
  }

  void waitLoad() async {
    await load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: load(),
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
  
  
  @override
  Widget build(BuildContext context) {

    
    int howManyDone() {
      int count = 0;
      for (int i = 0; i < achievementNames.length; i++) {
        if (achievementDesc[achievementNames[i]]![1]) {
          count++;
        }
      }
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
                        save();
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
      Container(
        height: 610,
        decoration: const BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/wallpaper.jpg"),fit: BoxFit.fill,)
          
        ),
        child:
          Expanded(
              flex: 7,
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
                                  save();
                                });
                              }),
                        )
                      ],
                    ),
              );
            },
          )),
    )
    ]);
  }
}
