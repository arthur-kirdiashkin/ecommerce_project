import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/app_custom_icons/custom_bottom_bar_icons.dart';
import '../../../../cart/domain/entities/cart_entity.dart';
import '../../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../../cart/presentation/bloc/cart_state.dart';
import '../../../../cart/presentation/pages/cart_page.dart';
import '../../../../../common/themes/app_colors.dart';
import '../../pages/home_page.dart';

class HomeBottomBarWidget extends StatefulWidget {
  const HomeBottomBarWidget({super.key});

  @override
  State<HomeBottomBarWidget> createState() => _HomeBottomBarWidgetState();
}

class _HomeBottomBarWidgetState extends State<HomeBottomBarWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Center(
      child: Text(
        'Basket',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Favourites',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
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
            context, MaterialPageRoute(builder: (context) => const Cartpage()));
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
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Explorer',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                icon: QuantityCart(),
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

class QuantityCart extends StatelessWidget {
  const QuantityCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<CartEntity> cartList = [];
        if (state is CartLoadedState) {
          cartList = state.cartProducts;
          return Badge(
            backgroundColor: AppColors.selectedColor,
            label: Text('${cartList[0].basket!.length}'),
            alignment: const Alignment(8, -4),
            child: basketIcon,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
