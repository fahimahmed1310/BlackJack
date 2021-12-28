import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: BlackJack(),
    ),
  ));
}



class BlackJack extends StatefulWidget {
  @override
  _BlackJackState createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack> {
  int leftCardNumber = 6 , rightCardNumber = 3;
  int cpuResult = 0, playerResult =0;
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/logo.jpeg",
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/card$leftCardNumber.png"),
                  Image.asset("assets/images/card$rightCardNumber.png"),
                ],
              ),
              TextButton(
                onPressed: (){
                  setState(() {
                    count++;
                    leftCardNumber = Random().nextInt(13) + 2;


                    rightCardNumber = Random().nextInt(13) + 2;


                    if(leftCardNumber > rightCardNumber)
                      {
                        playerResult++;
                      }
                    else{
                      cpuResult++;
                    }

                    if(count == 11)
                      {
                        print("Start Again");
                        cpuResult = 0;
                        playerResult = 0;
                        count = 0;
                      }



                  });
                },
                child: Image.asset("assets/images/dealbutton.png"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Player",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$playerResult",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children:  [
                      Text(
                        "CPU",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$cpuResult",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Count",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$count",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
