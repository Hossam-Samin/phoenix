import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) async{
   return Navigator.pushNamed(context, "/OnBoardingScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Colors.blueAccent,
              Colors.blue.shade900,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 350),
              child: Column(
                children: [
                  Text(
                    'Phoenix',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Rubik",
                    ),
                  ),
                   SizedBox(height: 50),
                  SpinKitSpinningLines(
                    color: Colors.white60,
                      size: 50,
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 5,right: 5,bottom: 50.0),
              child: Text(
                'Phoenix is a mobile application connects clients with freelancers to hire them for various projects or tasks.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontFamily: "Rubik",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}