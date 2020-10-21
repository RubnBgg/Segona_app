import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEROES OF ROCK',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'HEROES OF ROCK',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog(
        'Chuck Berry',
        'Solist',
        'Favorite Songs: Maybellene, Roll Over Beethoven, Johnny B.Goode.',
        'https://media.giphy.com/media/l4FGA1ZUV0rXEfndm/giphy.gif'))
    ..add(Dog(
        'Queen',
        'Group',
        'Favorite Songs: Killer Queen, Bohemian Rhapsody, Bicycle Race.',
        'https://logos-marcas.com/wp-content/uploads/2020/04/Queen-Emblema.jpg'))
    ..add(Dog(
        'Elton John',
        'Solist',
        'Favorite Songs: Crocodrile Rock, I´m Still Standing, Rocketman.',
        'https://media.giphy.com/media/3ohzdZuN635iVQe45a/giphy.gif'))
    ..add(Dog(
        'AC/DC',
        'Group',
        'Favorite Songs: Thunderstuck, Highway to hell, T.N.T.',
        'https://img.discogs.com/WwElBbslp3f33N0BVam_6mVPr2s=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-84752-1294786426.jpeg.jpg'))
    ..add(Dog('Elvis Presley', 'Solist', 'Favorite Songs: Jailhouse Rock, Hound Dog, Blue Suede Shoes, Burning Love.', 'https://media.giphy.com/media/5tvKUvYlwigHoix3uR/giphy.gif'))
    ..add(Dog('Heroes Del Silencio', 'Group', 'Favorite Songs: Entre Dos Tierras, Maldito Duende, La Sirena Varada.', 'https://i.pinimg.com/originals/31/5c/1e/315c1ea4db331f4c44ac98be33001824.jpg'))
    ..add(Dog('Johnny Cash', 'Solist', 'Favorite Songs: Hurt, Folson Prison Blues, Walk the line.', 'https://media.giphy.com/media/Igl6cjiFtE0mY/giphy.gif'));
  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.freepik.com/vector-gratis/mano-senal-rock-n-roll_225004-1111.jpg'),
                  fit: BoxFit.cover)),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
