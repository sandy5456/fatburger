
import 'package:fatburger/FOODMENU/soups.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/widgets/static_food_menu/food1.dart';
import 'package:fatburger/widgets/static_food_menu/hot_drinks.dart';
import 'package:fatburger/widgets/static_food_menu/iceCreams1.dart';
import 'package:flutter/material.dart';
class Tabbar extends StatefulWidget {
  String catagoryname;
  List<Food> foods;
  String images;
  int id;
  String name;
  double price;
  Tabbar({
    this.catagoryname,
    this.foods,
    this.name,
    this.id,
    this.price,
    this.images,
  });
  int colorVal=0xff84020e;
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar>  with  TickerProviderStateMixin{
TabController _tabController;
  
  @override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 4);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff84020e;
         });
     }
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.31,
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
               TabBar(
            controller: _tabController,
         
            
              indicatorSize: TabBarIndicatorSize.label,
            indicatorColor:Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon:Image.network("https://i.pinimg.com/originals/00/cc/b6/00ccb6f59d1215f5666ad229af120e9f.png",height: 30,
                 color: _tabController.index == 0
                          ? Color( widget.colorVal)
                          : Colors.grey),
                // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                //           ?  Color( widget.colorVal)
                //           : Colors.grey)),
              ),
               Tab(
                icon:Image.network("https://cdn0.iconfinder.com/data/icons/minimal-sweets/256/minimal_sweets_8-512.png",height: 30,
                 color: _tabController.index == 1
                          ? Color( widget.colorVal)
                          : Colors.grey),
                // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                //           ?  Color( widget.colorVal)
                //           : Colors.grey)),
              ),
              Tab(
                icon:Image.asset("images/food2.png",height: 30,
                 color: _tabController.index == 2
                          ? Color( widget.colorVal)
                          : Colors.grey),
                // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                //           ?  Color( widget.colorVal)
                //           : Colors.grey)),
              ),
                Tab(
                icon:Image.asset("images/food1.png",height: 30,
                 color: _tabController.index == 3
                          ? Color( widget.colorVal)
                          : Colors.grey),
                // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                //           ?  Color( widget.colorVal)
                //           : Colors.grey)),
              ),
            
            
            ],
          ),
            Expanded(
              child: TabBarView(
                 controller: _tabController,
                children: <Widget>[
                  Soups(
                  name: widget.catagoryname,
                  foods: widget.foods,
                ), IceCreams(), Food1(),Food1(),],
              ),
            )
          ],
        ),
      ),
    );
  }
}