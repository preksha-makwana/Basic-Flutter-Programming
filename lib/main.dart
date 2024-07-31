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
          child: Text("गायत्री मन्त्र\n\n ॐ भूर्भुवः स्वः\n तत्स॑वि॒तुर्वरे॑ण्यं\n भर्गो॑ दे॒वस्य॑ धीमहि।\n धियो॒ यो नः प्रचो॒दया॑त्॥",style: TextStyle(fontSize: 20, color: Colors.black),),
          ),
        ),

    );
  }
}