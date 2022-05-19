import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/imageavatar.png'),
              ),
              Text(
                'Qamar A. Safadi',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontFamily: 'SourceFansPro',
                    fontSize: 20,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+972 565 182 661",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceFansPro',
                        fontSize: 15),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "Qamar.elsafadi98@gmail.com",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceFansPro',
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
