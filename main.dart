import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SpinWheelApp());
}

class SpinWheelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spin Wheel Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpinWheelPage(),
    );
  }
}

class SpinWheelPage extends StatefulWidget {
  @override
  _SpinWheelPageState createState() => _SpinWheelPageState();
}

class _SpinWheelPageState extends State<SpinWheelPage> {
  int points = 0;
  String result = "Tekan tombol SPIN untuk mulai!";

  void spinWheel() {
    int spinResult = Random().nextInt(100) + 1; // angka acak 1–100
    setState(() {
      points += spinResult;
      result = "Kamu dapat $spinResult poin!";
    });
  }

  void tarikSaldo() {
    if (points >= 200) {
      setState(() {
        points -= 200;
        result = "Saldo DANA berhasil ditarik (dummy)!";
      });
    } else {
      setState(() {
        result = "Poin belum cukup untuk tarik saldo!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spin Wheel Game"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Poin: $points",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: spinWheel,
              child: Text("SPIN 🎡"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: tarikSaldo,
              child: Text("Tarik Saldo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
