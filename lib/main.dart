import 'package:flutter/material.dart';
import 'package:movieslist/Details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: movieslist(),
    );
  }
}
int index;
class movieslist extends StatefulWidget {
  @override
  _movieslistState createState() => _movieslistState();
}

class _movieslistState extends State<movieslist> {
  var list = <String>[
    'Avatar',
    'I Am Legend',
    '300',
    'The Avengers',
    'Wolf Of Wall Street',
    'Interstellar',
    'Game Of Thrones',
    'Vikings',
    'Gotham',
    'Power',
    'Narcos',
    'Breaking Bad',
    'Doctor Strange',
    'Rogue One: A Star Wars Story',
    'Assassin' + 's Creed',
    'Luke Cage'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(itemBuilder: (BuildContext Context,int i){
          return InkWell(
            child: Container(
              margin: EdgeInsets.only(bottom: 0.0,),

              //color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: <Widget>[

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(14.0)
                      ),
                      margin: EdgeInsets.only(left: 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${list[i]}"),
                              Text("${display[i].d['Year']}"),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("${display[i].d['Runtime']}"),
                              Text("${display[i].d['imdbRating']}/10"),
                              Text("${display[i].d['Language']}"),

                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(display[i].d['Poster']),fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>details()));
              index = i;
            },
          );
        },
          itemCount: list.length,

        ),
      ),

    );
  }
}
