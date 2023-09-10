import 'package:ecommerce_project/application/ui/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_project/application/ui/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:ecommerce_project/application/ui/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/app_custom_icons/custom_bottom_bar_icons.dart';

class HomeBottomBarWidget extends StatefulWidget {
  const HomeBottomBarWidget({super.key});

  @override
  State<HomeBottomBarWidget> createState() => _HomeBottomBarWidgetState();
}

class _HomeBottomBarWidgetState extends State<HomeBottomBarWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Index 1: Basket',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Favourites',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index != 1) {
        _selectedIndex = index;
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cartpage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainScreenColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 69,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            backgroundColor: AppColors.buttonBarColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ellipseIcon,
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Explorer',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: Badge(
                  child: basketIcon,
                  label: Text('2'),
                  alignment: Alignment(8, -4),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: favouritesIcon,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: settingIcon,
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
