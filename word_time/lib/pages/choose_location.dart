import 'package:flutter/material.dart';
import 'package:word_time/services/word_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WordTime> Location = [
    WordTime(location: 'Tehran',flag: 'iran.png',url: 'ASIA/TEHRAN'),
    WordTime(location: 'Madrid',flag: 'spain.png',url: 'EUROPE/MADRID'),
    WordTime(location: 'Rome',flag: 'italy.png',url: 'EUROPE/ROME'),
    WordTime(location: 'Amsterdam',flag: 'netherlands.png',url: 'EUROPE/AMSTERDAM'),
    WordTime(location: 'NewYork',flag: 'america.png',url: 'AMERICA/NEW_YORK'),
    WordTime(location: 'Tokyo',flag: 'japan.png',url: 'ASIA/TOKYO'),
    WordTime(location: 'Berlin',flag: 'german.png',url: 'EUROPE/BERLIN'),
    WordTime(location: 'Paris',flag: 'france.png',url: 'EUROPE/PARIS'),
    WordTime(location: 'London',flag: 'english.png',url: 'EUROPE/LONDON'),
    WordTime(location: 'Athens',flag: 'greece.png',url: 'EUROPE/ATHENS'),
    WordTime(location: 'Lisbon',flag: 'portugal.png',url: 'EUROPE/LISBON'),
    WordTime(location: 'Moscow',flag: 'russia.png',url: 'EUROPE/MOSCOW'),
    WordTime(location: 'Qatar',flag: 'qatar.png',url: 'ASIA/QATAR'),
    WordTime(location: 'Singapore',flag: 'singapore.png',url: 'ASIA/SINGAPORE'),
    WordTime(location: 'Kabul',flag: 'afghanistan.png',url: 'ASIA/KABUL'),
    WordTime(location: 'Hong Kong',flag: 'china.png',url: 'ASIA/HONG_KONG'),
    WordTime(location: 'Kiev',flag: 'ukraine.png',url: 'EUROPE/KIEV'),
    WordTime(location: 'Dubai',flag: 'united-arab-emirates.png',url: 'ASIA/DUBAI'),
    WordTime(location: 'Panama',flag: 'panama.png',url: 'AMERICA/PANAMA'),
    WordTime(location: 'Buenos Aires',flag: 'argentina.png',url: 'AMERICA/ARGENTINA/BUENOS_AIRES'),
    WordTime(location: 'Costa Rica',flag: 'costa-rica.png',url: 'AMERICA/COSTA_RICA'),
    WordTime(location: 'Beirut',flag: 'lebanon.png',url: 'ASIA/BEIRUT'),
    WordTime(location: 'Lima',flag: 'peru.png',url: 'AMERICA/LIMA'),
  ];


  void updateTime(index) async{
    WordTime intance = Location[index];
    await intance.getData();
    Navigator.pop(context,{
      'time':intance.time,
      'location':intance.location,
      'flag':intance.flag,
      'isDayTime': intance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text('Location',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
      ),
      body: ListView.builder(
        itemCount: Location.length,
        itemBuilder: (context,index){
          return  Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 3.0),
            child: Card(
              color: (Colors.redAccent).withOpacity(0.5),
              child: ListTile(
                onTap: (){this.updateTime(index);},
                title: Text(Location[index].location , style: TextStyle(color: Colors.white),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${Location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
