import 'package:flutter/material.dart';
class RightNavigationBar extends StatefulWidget {
  @override
  _RightNavigationBarState createState() => new _RightNavigationBarState();
}

class _RightNavigationBarState extends State<RightNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return new Align(
      
      alignment: FractionalOffset.centerRight,
      child: new Container(
        
        child: new Column(
          children: <Widget>[
             new UserAccountsDrawerHeader(
               
               currentAccountPicture: CircleAvatar(
               backgroundColor: Colors.white,
                 child: Image.asset("images/logo.png"),
               ),
            accountName: const Text('Test Widget'),
            decoration: BoxDecoration(
              color: Colors.black

            ),
            accountEmail: const Text('test.widget@example.com'),
            margin: EdgeInsets.zero,
            onDetailsPressed: () {},
          ),
          new Expanded(
            child: new ListView(
              padding: const EdgeInsets.only(top: 8.0),
              children: <Widget>[
              
                // The drawer's "details" view.
                new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.person,color: Colors.white54,),
                      title: const Text('Your account',style: TextStyle(color:Colors.white54 ),),
                    ),
                      new ListTile(
                      leading: const Icon(Icons.person_outline,color: Colors.white54,),
                      title: const Text('Admin',style: TextStyle(color:Colors.white54 ),),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.help,color: Colors.white54,),
                      title: const Text('Help',style: TextStyle(color:Colors.white54 ),),
                    ),
                     new ListTile(
                      leading: const Icon(Icons.credit_card,color: Colors.white54,),
                      title: const Text('Payments',style: TextStyle(color:Colors.white54 ),),
                    ),
                     new ListTile(
                      leading: const Icon(Icons.people,color: Colors.white54,),
                      title: const Text('About',style: TextStyle(color:Colors.white54 ),),
                    ),
                     new ListTile(
                      leading: const Icon(Icons.fingerprint,color: Colors.white54,),
                      title: const Text('Logout',style: TextStyle(color:Colors.white54 ),),
                    ),
                  ],
                ),
              ],
            ),
          ), 
          ],
        ),
        color: Colors.black,
          height: MediaQuery.of(context).size.height *
                                        1,
          width: MediaQuery.of(context).size.width *
                                       0.75,
      ),
    );
  }

  
}
