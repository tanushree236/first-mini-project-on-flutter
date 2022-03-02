import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getdata() async{
  //   Response response=await get(Uri.http('jsonplaceholder.typicode.com', 'todos/1'));
  //   Map data=jsonDecode(response.body) ;       //works only if you import dart:convert
  //   print(data);
  //   print(data['title']);   //gives the particular value
  // }


  //String time='loading';

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.gettime();

    // print(instance.time);
    // setState(() {
    //   time=instance.time;          //gets time
    // });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('Init state function run');   //runs only once

    //getdata();
    // gettime();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
            child:
            Text(
                'Loading....',
              style: TextStyle(
                fontFamily: 'Hubballi',     //font style
              ),
            ),
        ),
      ),
    );
  }
}
