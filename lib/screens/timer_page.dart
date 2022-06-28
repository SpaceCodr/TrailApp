import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_components.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

final _auth = FirebaseAuth.instance;

class _TimerPageState extends State<TimerPage> {
  bool breakAvail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIMER',
          style: TextStyle(
            fontFamily: 'Titlefont6',
            fontSize: 40,
            wordSpacing: 5,
          ),
        ),
        leading: null,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.orange,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout_outlined,size: 30,),

          ),
        ],
      ),
      body: TweenAnimationBuilder<Duration>(
        duration: Duration(minutes: 25),
        tween: breakAvail ? Tween(begin: Duration(minutes: 5),end: Duration.zero) : Tween(begin: Duration(minutes: 25),end: Duration.zero),
        onEnd: (){
          print('Break');

        },
        builder: (BuildContext context,Duration value,Widget? child){
          final minutes =  value.inMinutes;
          final seconds = value.inSeconds%60;
          return Column(
            children: [
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text('$minutes:$seconds',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontFamily: 'Titlefont5',fontWeight: FontWeight.bold,fontSize: 150),
                  ),
                ),
              ),
              Center(
                child: MyButton(colour: Colors.lightGreen, title: 'Break',
                    onPressed : () {
                      breakAvail = true;
                    }
                ),
              ),
              Row(
                children: [
                  MyButton(colour: Colors.indigoAccent, title: 'Start', onPressed: null),
                  MyButton(colour: Colors.lightBlueAccent, title: 'Stop', onPressed: null)
                ],
              )
            ],
          );
        },
      ),
    );
  }

}
