import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String  location; //location name for UI
  late String time; //the time in the location
  late String flag; //url to an asset flag icon
  late String url; //location url for api endpoint
  late bool isDayTime;  //true or false if daytime or not



  WorldTime({required this.location,required this.flag,required this.url});



  Future <void> gettime() async{
    //make request
    Response  response=await get(Uri.http('worldtimeapi.org', 'api/timezone/$url'));
    Map data=jsonDecode(response.body);
    print(data);

    //to get properties from data
    String daytime=data['datetime'];
    // print(daytime);   //gives 2022-03-01T17:43:52.216158+05:30

    // String offset = data['utc_offset'];    //gives +05:30
    String offset = data['utc_offset'].substring(1,3);   //gives 05:30 (without the'+')
    print(offset);

    // String timenow=data['utc_datetime'].substring(0,10);
    // print(timenow);                  //gives only date



    //create a daytime object
    DateTime now= DateTime.parse(daytime);    //gives u current time
    now=now.add(Duration(hours:int.parse(offset) ));    //use to add specified amount of time or a duration to a date obj   //now.add(Duration(hours:int.parse(offset) ) => this alone is non-destructive it doesn't directly update it so save it in a variable
    // print(now);     ////gives current updated time




    //set the time property
    //time=now.toString();
    time=DateFormat.jm().format(now);


    isDayTime = now.hour>6 && now.hour<20 ? true : false;

  }
}


//WorldTime instance=WorldTime(location: 'Kolkata', flag: 'India', url: 'Asia/Kolkata');
