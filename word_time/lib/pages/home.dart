import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String dayLabel = data['isDayTime'] ? "DAY" : "NIGHT";
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/${data['flag']}'),
          ),
          SizedBox(
            height: 15.0,
          ),
          FlatButton.icon(
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'flag': result['flag'],
                  'isDayTime': result['isDayTime'],
                };
              });
            },
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            label: Text(
              'Change Location',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.redAccent,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data['location'],
                style: TextStyle(fontSize: 35.0, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data['time'],
                style: TextStyle(fontSize: 60.0, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.timelapse,
              color: Colors.white,
            ),
            label: Text(
              '$dayLabel',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
