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
  final _words=<WordPair>[];
  final _checkedWords=new Set<WordPair>(); // set contains "no duplicate items"
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair=new WordPair.random();
//    return new Text(
//      wordPair.asUpperCase,
//      style: new TextStyle(fontSize: 20.0),
//    );

  return new Scaffold(
    appBar: new AppBar(
      title: new Text("List of English words"),
      actions: <Widget>[
        new IconButton(icon: new Icon(Icons.dehaze), onPressed: _pushToSaveWordScreen)
      ],
    ),
    body: new ListView.builder(itemBuilder: (context, index){

      if(index>=_words.length){
        _words.addAll(generateWordPairs().take(10));
      }

      return _buildRow(_words[index], index);
    }),
  );

  }

  _pushToSaveWordScreen(){
    final pageRouter=new MaterialPageRoute(builder: (context){
      final listTiles=_checkedWords.map((wordPair){
          return new ListTile(
            title: new Text(wordPair.asUpperCase,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          );
      });
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Checked words"),
        ),
        body: new ListView(children: listTiles.toList(),),
      );
    });
    Navigator.of(context).push(pageRouter);
  }

  Widget _buildRow(WordPair wordPair, int index){

    final color=index % 2 ==0 ? Colors.red : Colors.green;
    final ischecked=_checkedWords.contains(wordPair);
    // this widget is fot each row
    return new ListTile(
      leading: new Icon(ischecked ? Icons.check_box:Icons.check_box_outline_blank,
        color: color,

      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: color),
      ),
      onTap: (){
        setState(() {
          if(ischecked){
            _checkedWords.remove(wordPair);
          }else{
            _checkedWords.add(wordPair);
          }
        });
      },
    );
  }

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new MaterialApp(
      title: "This is my first Flutter",
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("This is Header's title"),
//        ),
//        body: new Center(
//          //child: new Text("This is the body's center"),
//          child:new RandomEnglishWords()
//        ),
//      ),
    home: new RandomEnglishWords(),
    );
  }
}