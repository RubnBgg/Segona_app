import 'package:basic_flutter_app/dog_model.dart';
import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => new _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController img = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.red,
        content: new Text('DONT FORGET THE NAME, BASTARD!'),
      ));
    } else {
      var newDog = new Dog(nameController.text, locationController.text,
          descriptionController.text, img.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('A NEW HEROE BORN'),
        backgroundColor: Colors.red[500],
      ),
      body: new Container(
        color: Colors.red[400],
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(labelText: 'HEROE/ES'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                //onChanged: (v) => locationController.text = v,
                decoration: new InputDecoration(labelText: "GROUP/SOLIST"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                //onChanged: (v) => descriptionController.text = v,
                decoration: new InputDecoration(labelText: 'FAVORITE SONGS'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitPup(context),
                    color: Colors.yellowAccent[400],
                    child: new Text('RISE TO HEROE!'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
