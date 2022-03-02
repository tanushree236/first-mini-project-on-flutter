import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'world_time.dart';
import 'loading.dart';
import 'choose_location.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};


  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map ;
    print(data);


    //set background image
    String bgImage= data['isDayTime'] ? 'day2.jpg' : 'night.jpg';     //gives morning or night image according to the time of the place
    Color? bgcolor=data['isDayTime'] ? Colors.blue : Colors.indigo[800];


    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result= await Navigator.pushNamed(context, '/loaction');      //goes to another page
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 50.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
