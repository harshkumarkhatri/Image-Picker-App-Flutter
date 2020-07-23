import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryTextTheme: TextTheme(
        headline6: TextStyle(color:Colors.black)
      ),
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Clicking Images'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future get_image() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future pick_image() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: 352,
            child: Center(
                child:
                    _image == null ? Text("Interact by clicking the buttons below",style: TextStyle(fontSize: 20),) : Image.file(_image)),
          ),
          SizedBox(height: 132),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(tooltip: "Choose from gallary",foregroundColor: Colors.black,backgroundColor: Colors.red,
                onPressed: () {
                  pick_image();
                },
                child: Icon(Icons.photo),
              ),
              SizedBox(height: 20),
              FloatingActionButton(tooltip: "Open Camera",foregroundColor: Colors.black,backgroundColor: Colors.red,
                onPressed: () {
                  get_image();
                },
                child: Icon(Icons.camera),
              )
            ],
          ),
          RaisedButton(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
            onPressed: () {
              setState(() {
                _image = null;
              });
            },
            color: Colors.redAccent,
            textColor: Colors.black,child: Text("Reset"),
          )
        ],
      ),
    );
  }
}
