import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/views/lost_item_add_page/lostItemAddPage.dart';
import 'package:lost_found/views/lost_item_page/lostItemPage.dart';
import 'package:lost_found/views/profile_page/profilePage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   List<Widget> _buildScreens(){
    return  [
      LostItemAddPage(),
      LostItemPage(),
      ProfilePage(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems(){
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.table_rows),
        title: ("Lost Items"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
      ),
    );
  }
}
