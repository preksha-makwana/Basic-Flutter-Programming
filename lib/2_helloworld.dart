import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          alignment: Alignment.center,
          width: 700,
          height: 700,
          color: Colors.purpleAccent,
          child: Container(
            alignment: Alignment.center,
            width: 600,
            height: 600,
            color: Colors.blueAccent,
            child: Container(
              alignment: Alignment.center,
              width: 500,
              height: 500,
              color: Colors.lightBlue,
              child: Container(
                alignment: Alignment.center,
                width: 400,
                height: 400,
                color: Colors.lightGreen,
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  color: Colors.yellow,
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    color: Colors.orangeAccent,
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      color: Colors.redAccent,
                      child: Text("Hello!",style: TextStyle(fontSize: 20, color: Colors.black),),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}