import 'package:Foodgraphic/view/pages/explorer.dart';
import 'package:flutter/material.dart';

import '../../helper/demo_values.dart';
import '../widgets/post_card.dart';
import 'dart:async';

import 'camera.dart';

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
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
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            //in this demo, only the button text is updated based on the bottom app bar clicks
            child: ListView.builder(
              itemCount: DemoValues.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(postData: DemoValues.posts[index]);
              },
            ),
          ),

          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.green[800]),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[800],
        onPressed: () {
          setState(() async {
            clickedCentreFAB =
                !clickedCentreFAB; //to update the animated container
            _navigateToForgotCameraPage(context);
          });
        },
        tooltip: "Centre FAB",
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0, "Home");
                  _navigateToHomePage(context);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.green.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
                  _navigateToExplorrerPage(context);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.maps_ugc,
                  color: selectedIndex == 1
                      ? Colors.green.shade900
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.extension_rounded,
                  color: selectedIndex == 2
                      ? Colors.green.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.account_box,
                  color: selectedIndex == 3
                      ? Colors.green.shade900
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}

Future _navigateToForgotCameraPage(context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Camera()),
  );
}

Future _navigateToExplorrerPage(context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ExplorerPage()),
  );
}

Future _navigateToHomePage(context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}
