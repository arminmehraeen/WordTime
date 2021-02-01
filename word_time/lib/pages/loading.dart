import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:word_time/services/word_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool isConnected = false;

  void setupWordTime() async {
    WordTime instance =
        WordTime(location: 'Tehran', flag: 'iran.png', url: 'ASIA/TEHRAN');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  void connectionCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          this.isConnected = true;
        });
        this.setupWordTime();
      }
    } on SocketException catch (_) {
      setState(() {
        this.isConnected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.connectionCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          new Expanded(
              child: Container(
                color: Colors.black54,
                child: SpinKitFadingCube(
                  color: Colors.white,
                  size: 50.0,
                ),
              )
          ),
          Container(
            height: 50.0,
            child: (isConnected)? Container() : new Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                child: FlatButton.icon(
                    color:Colors.redAccent,
                    onPressed: (){
                      setState(() {
                        this.isConnected = true;
                      });
                      this.connectionCheck();},
                    icon: Icon(Icons.refresh,color: Colors.white,),
                    label: Text('Not Connected ! Try again ',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
