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
var achievementDesc;
loadTemplate() async
{
  String response;
  response = await rootBundle.loadString("assets/Templates/template2.txt");
  template = jsonDecode(response);
  //print(template["template"]);
  achievementDesc=template;
  //await achievementDescLoad();

}


loadProgress() async {
  final directory = await getApplicationDocumentsDirectory();
  var file;
  
  if(await File('${directory.path}/progress.json').exists())
  {
    file = File('${directory.path}/progress.json');
    await file.delete();
    String read = await file.readAsString();
    final result = jsonDecode(read);
    achievementDesc = result;
  }
  else
  {
    print("s");
    await loadTemplate();
  }
  
  /*for (int i = 0; i < achievementDesc.length; i++) {
    achievementDesc[achievementNames[i]]![1] = result[achievementNames[i]][1];
  }*/
}

List<String> achievementNames = [
  
];

//Map<String, List> achievementDesc = {
  
//};
achievementDescLoad()
{
  /*for(int i=0; i<template["template"].length; i++)
  {
    //final addition = template["template"][0]["name"];
    achievementDesc[template["template"][i]["name"]] = [template["template"][i]["desc"],template["template"][i]["finished"],template["template"][i]["type"]];
    achievementNames.add(template["template"][i]["name"]);
  }
  print(achievementDesc["Double Crossed"]);*/
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
      
      print(achievementDesc["template"]);
      for (int i = 0; i < achievementDesc["template"].length; i++) {
        if (achievementDesc["template"][i]["finished"]) {
          count++;
        }
      }
      print(achievementDesc["template"].length);
      return count;
    }

    void sort(){
      /*if(complete){
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
      */
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
                        for (int i = 0; i < achievementDesc["template"].length; i++) {
                          achievementDesc["template"][i]["finished"] = false;
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
                      "Progress: $done / ${achievementDesc["template"].length}",
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
                value: done / achievementDesc["template"].length,
                minHeight: 10,
                valueColor: const AlwaysStoppedAnimation(Colors.red),
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
              
              itemCount: achievementDesc["template"].length,
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
                              achievementDesc["templates"][index]["name"],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 6, 0, 15),
                              child: Text(
                                achievementDesc["templates"][index]["desc"],
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
                            value: achievementDesc["templates"][index]["finished"],
                            onChanged: (bool? value) {
                              setState(() {
                                achievementDesc["templates"][index]["finished"] =
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
