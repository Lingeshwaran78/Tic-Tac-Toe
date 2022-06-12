import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:xo/homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 35),
                  child: const Text('Welcome To Jumanji',
                      style: TextStyle(
                          fontSize: 19,
                          color: Color(0xff90bb885),
                          fontFamily: 'PressStart')),
                ),
              ),
              const SizedBox(height: 125),
              AvatarGlow(
                endRadius: 150,
                shape: BoxShape.circle,
                glowColor: Colors.red,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                duration: const Duration(seconds: 2),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey[900],
                        child: Image.asset('lib/images/tictactoelogo.png'))),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                  child: const Text('Let\'s Play',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'PressStart')))
            ]));
  }
}
