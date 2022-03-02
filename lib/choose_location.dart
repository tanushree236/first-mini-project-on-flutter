import 'package:flutter/material.dart';
import 'world_time.dart';
/*Asynchronous operations let your program complete work while waiting for another operation to finish.
  Asynchronous code using futures and the async and await keywords.*/


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'toronto.png'),
    WorldTime(url: 'Europe/Paris', location: 'France', flag: 'france.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kanya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'aus.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];    //await is only used with async
    await instance.gettime();

    //Navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }



  @override

  Widget build(BuildContext context) {

    //  print('bulid  state function run');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
            'WELCOME TO LOCATIONS',
        style: TextStyle(
          fontFamily: 'Italic',
          fontSize: 24.0,
        ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body:
      ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap:(){
                  updateTime(index);
                },
                title:Text(
                    locations[index].location,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),    //to display flag with country
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
