import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<Imagemodel> images = [];
  void fetchimage() async {
    counter++;
    var response =
        await https.get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imagemodel = Imagemodel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imagemodel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Imagelist(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchimage,
        ),
        appBar: AppBar(
          title: Text('Lets see some images'),
        ),
      ),
    );
  }
}
