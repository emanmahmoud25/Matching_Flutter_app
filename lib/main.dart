import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Match the pictures"),
        backgroundColor: Colors.indigo[300],
      ),
      body: imagepage(),
    ),
  ));
}

class imagepage extends StatefulWidget {
  //const imagepage({super.key});

  @override
  State<imagepage> createState() => _imagepageState();
}

class _imagepageState extends State<imagepage> {
  int leftimagenumber = 1;
  int rigthimagenumber = 2;
  void change_image() {
    leftimagenumber = Random().nextInt(8) + 1;
    rigthimagenumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    // const imagepage({super.key});
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftimagenumber == rigthimagenumber ? "congratulations" : "Try Again",
          style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
        //the second  way to add photo

        /*important
        List of replaced classes:

FlatButton → TextButton
RaisedButton → ElevatedButton
OutlineButton → OutlinedButton
ButtonTheme → TextButtonTheme, ElevatedButtonTheme, OutlineButtonTheme
*/
        //Padding(padding: EdgeInsets.all(20)),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Row(children: [
          Expanded(
            child: TextButton(
              //  flex: 2,
              onPressed: () {
                // print("Left Button is Pressed");
                setState(() {
                  change_image();
                });
              },

              child: Image.asset('images/image-$leftimagenumber.png'),
            ),
          ),
          Expanded(
              // flex: 1,
              child: TextButton(
            onPressed: () {
              // print("Rigth Button is Pressed");
              setState(() {
                change_image();
              });
            },
            //  child: Padding(
            //// padding: EdgeInsets.all(20),
            //   child: Image(
            //  image: AssetImage("images/image-1.png"),
            child: Image.asset("images/image-$rigthimagenumber.png"),
          )),
        ])
      ],
    );
  }
}
