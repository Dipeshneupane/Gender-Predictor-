import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';

void main(){
  runApp(Myapp());
}


class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData.dark(),
    );
  }

}


class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Homepagestate();

}

class Homepagestate extends State <Homepage>{
  TextEditingController _nameController = TextEditingController();
  var result;

  predictGender(String name)async{
  var url = "https://api.genderize.io?name=$name";
  var res = await http.get(url);
  var body = jsonDecode(res.body);

  result = "Name: ${body['name']} Gender: ${body['gender']} Probability: ${body['probability']}";
  setState(() {

  });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Geneder Predector"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Enter the Name"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            RaisedButton(
              child: Text("Submit"),
                onPressed: ()=> predictGender(_nameController.text)),
            if (result!= null)
            Text(result)
          ],
        ),
      ),
    );
  }
}