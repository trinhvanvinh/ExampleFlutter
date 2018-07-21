import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main(){
  runApp(new MyApp());
}

class RandomEnglishWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomEnglishWordsState();
  }
}
// state
class RandomEnglishWordsState extends State<RandomEnglishWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair=new WordPair.random();
    return new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 20.0),
    );

  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new MaterialApp(
      title: "This is my first Flutter",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("This is Header's title"),
        ),
        body: new Center(
          //child: new Text("This is the body's center"),
          child:new RandomEnglishWords()
        ),
      ),
    );
  }
}