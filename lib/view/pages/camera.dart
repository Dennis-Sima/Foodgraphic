import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:chips_choice/chips_choice.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'home_page.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File myImage;
  final _picker = ImagePicker();

  // single choice value
  int tag = 1;
  List<String> tags = [];

  // list of string options
  List<String> options = [
    'Food',
    'Breakfast',
    'Fit-Food',
    'Family',
    'Nutritous',
    'Education',
    'Fashion',
    'Travel',
    'Nice2Meat',
    'Yumm',
    'Vegan',
  ];

  // Function to open a camera
  Future openCamera() async {
    var cameraImage = await _picker.getImage(source: ImageSource.camera);
    final File file = File(cameraImage.path);

    setState(() {
      myImage = file;
    });
  }

  // Function to open a local gallery
  Future openGalley() async {
    var galleryImage = await _picker.getImage(source: ImageSource.gallery);
    final File file = File(galleryImage.path);
    setState(() {
      myImage = file;
    });
  }

  // Function to show dialog box
  Future<void> openDialogBox() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: Colors.green[800],
          title: Text(
            'Choose options',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                MaterialButton(
                  color: Colors.green[900],
                  child: Text(
                    "Open Camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openCamera();
                  },
                ),
                MaterialButton(
                  color: Colors.green[900],
                  child: Text(
                    "Open Galley",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openGalley();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int _state = 0;

  Widget setUpButtonChild() {
    if (_state == 0) {
      return Container(
        width: 100,
        height: 30,
        child: Row(
          children: <Widget>[
            Icon(Icons.send),
            SizedBox(width: 10),
            Text("Publish"),
          ],
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _state = 2;
        Timer(Duration(milliseconds: 600), () {
          _navigateToHomePage(context);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset("assets/images/foodgraphic.jpg"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_rounded,
              color: Colors.green[900],
            ),
            onPressed: () {
              //_navigateToCartPage(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 300,
              ),
              child: myImage == null
                  ? Center(
                      child: Text(
                      "No image selected",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ))
                  : Image.file(myImage),
            ),
            Content(
              title: 'Select some Hashtags',
              child: ChipsChoice<String>.multiple(
                value: tags,
                onChanged: (val) => setState(() => tags = val),
                choiceItems: C2Choice.listFrom<String, String>(
                  source: options,
                  value: (i, v) => v,
                  label: (i, v) => v,
                  tooltip: (i, v) => v,
                ),
                wrapped: true,
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              minLines: 3,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              color: Colors.green[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              child: setUpButtonChild(),
              onPressed: () {
                setState(() {
                  if (_state == 0) {
                    animateButton();
                  }
                });
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialogBox();
        },
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.green[900],
      ),
    );
  }
}

class Content extends StatefulWidget {
  final String title;
  final Widget child;

  Content({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content>
    with AutomaticKeepAliveClientMixin<Content> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.blueGrey[50],
            child: Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          Flexible(fit: FlexFit.loose, child: widget.child),
        ],
      ),
    );
  }
}

Future _navigateToHomePage(context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}
