import 'package:fatburger/pages/HomeScreen.dart';
import 'package:fatburger/pages/offer_screen.dart';

import 'package:fatburger/widgets/drawer_screen.dart';
import 'package:fatburger/widgets/static_food_menu/fav_page.dart';
import 'package:fatburger/widgets/static_food_menu/offers_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YoutubeMain extends StatefulWidget {
  @override
  _YoutubeMainState createState() => _YoutubeMainState();
}

class _YoutubeMainState extends State<YoutubeMain> {
  int _currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      MyHomePage(),
      //HomeScreen(),
      OffferScreen(),
      // Center(child: Text("Subscriptions",style: TextStyle(color: Colors.black),)),

      FavScreen(),
      RightNavigationBar()
    ];

    return Scaffold(
      key: scaffoldKey,
      //  endDrawer: Drawer(
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(18.0),
      //       child: ListView(
      //         children: <Widget>[
      //           ListTile(
      //             title: Text('Item1'),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      //   ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YoutubeMain()),
              );
            },
            child: Image.asset("images/logo1.png"),
            elevation: 2.0),
      ),
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xff84020e),
          unselectedItemColor: Colors.black,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
               activeIcon: Image.asset("images/HOME1.png",height: 35),
              title: Text("Home",
             // style: TextStyle(color: Color(0xff84020e)),
              ),
              icon: Image.network(
                "https://static.thenounproject.com/png/1306759-200.png",
                height: 35,
              ),
            ),

            BottomNavigationBarItem(
               activeIcon: Image.asset("images/OFFER1.png",height: 35),
              title: Text("offers"),
              icon: Image.network(
                "https://cdn0.iconfinder.com/data/icons/shopping-4-7/68/169-512.png",
                height: 30,
              ),
            ),
            //  BottomNavigationBarItem(
            //     title: Text(""), icon: Image.asset("images/logo.png",height: 50,width: 50,),),
            BottomNavigationBarItem(
              activeIcon: Image.asset("images/FAV1.png",height: 35),
              title: Text("favourite"),
              icon: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM5IKxarGuwdtAV8cd31jc0-BhGb__jHSC_6TegoypKvi5DqA0&s",
                height: 30,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset("images/SETTINGS1.png",height: 35),
              title: Text("settings",),
              icon: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFEcnC4OXu-3RYWD5O6-3vZgV6_iYKye15UtrE0c51VakhzlGL&s",
                height: 30,
              ),
            ),
          ]),
    );
  }

  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Color(0xff232f34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color(0xff344955),
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Color(0xff232f34), width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.stack.imgur.com/S11YG.jpg?s=64&g=1",
                                      fit: BoxFit.cover,
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Inbox",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.inbox,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Starred",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Sent",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Trash",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.delete_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Spam",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Drafts",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.mail_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
                Container(
                  height: 56,
                  color: Color(0xff4a6572),
                )
              ],
            ),
          );
        });
  }
}
