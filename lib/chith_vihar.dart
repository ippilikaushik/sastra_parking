import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('SASTRA VEHICLE PARKING GUIDE'),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
           Image.asset(
            'assets/images/sastra.png',
          ),
          RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('Main Gate Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('Chanakya Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('Chith Vihar Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('Vidyut Vihar Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('VKJ Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          child: Text('ASK Parking Slot'),
          onPressed: () {
            //Use`Navigator` widget to push the second screen to out stack of screens
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondScreen();
            }));
          },
        ),
        ],

      ),
    );
  }
}


class SecondScreen extends StatefulWidget {
  var count=25;
  @override
    
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text('Parking Availability'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('parking_slots').snapshots(),
        builder: (context,snapshot)
    {
    if(!snapshot.hasData) return Text('Loading data.... Please Wait...', textAlign: TextAlign.center,style: TextStyle(height: 5.0, fontSize:25));
    return Column(
    children : <Widget>[

    Text('Total number of Slots :'+ widget.count.toString(), textAlign: TextAlign.center, style: TextStyle(height: 5.0, fontSize:25)),
    Text('Number of Slots Filled :'+snapshot.data.documents[0]['slots'].toString(), textAlign: TextAlign.center, style: TextStyle(height: 5.0, fontSize:25), ),
    Text('Number of Slots Available :'+(widget.count-snapshot.data.documents[0]['slots']).toString(), textAlign: TextAlign.center, style: TextStyle(height: 5.0, fontSize:25), ),
    Text('', textAlign: TextAlign.center, style: TextStyle(height: 5.0, fontSize:25), ),
    RaisedButton(
    color: Colors.blue,
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
    child: Text('Go back to home'),
    onPressed: ()
    {
    //Use`Navigator` widget to pop oir go back to previous route / screen
    Navigator.pop(context);

    }
    ,
    ),
    ],
    );
    },
    ));
 
  }
}

