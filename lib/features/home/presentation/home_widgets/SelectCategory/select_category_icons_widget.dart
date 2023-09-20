import 'package:ecommerce_project/common/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/themes/app_colors.dart';

class CategoryIcon {
  String label;
  String iconPath;
  int id;

  CategoryIcon({
    required this.label,
    required this.iconPath,
    required this.id,
  });
}

class SelectCategoryIconsWidget extends StatefulWidget {
  const SelectCategoryIconsWidget({super.key});

  @override
  State<SelectCategoryIconsWidget> createState() =>
      _SelectCategoryIconsWidgetState();
}

class _SelectCategoryIconsWidgetState extends State<SelectCategoryIconsWidget> {
  int _selectedIndex = 0;
  List<CategoryIcon> categoryIcons = [
    CategoryIcon(
      label: 'Phones',
      iconPath: phonesPath,
      id: 0,
    ),
    CategoryIcon(
      label: 'Computer',
      iconPath: computerPath,
      id: 1,
    ),
    CategoryIcon(
      label: 'Health',
      iconPath: healthPath,
      id: 2,
    ),
    CategoryIcon(
      label: 'Books',
      iconPath: booksPath,
      id: 3,
    ),
    CategoryIcon(
      label: '',
      iconPath: booksPath,
      id: 4,
    ),
    CategoryIcon(
      label: '',
      iconPath: booksPath,
      id: 5,
    ),
    CategoryIcon(
      label: '',
      iconPath: booksPath,
      id: 6,
    ),
    CategoryIcon(
      label: '',
      iconPath: booksPath,
      id: 7,
    ),
  ];

  void _onItemTappedIcon(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 27),
        scrollDirection: Axis.horizontal,
        itemCount: categoryIcons.length,
        itemBuilder: (context, index) {
          final icons = categoryIcons[index];
          return Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Column(
              children: [
                Container(
                    height: 71,
                    width: 71,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 0,
                            offset: const Offset(2, 2),
                          )
                        ]),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedIndex == index
                              ? AppColors.selectedColor
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                      onPressed: () => _onItemTappedIcon(index),
                      child: SvgPicture.asset(
                        icons.iconPath,
                        colorFilter: ColorFilter.mode(
                            _selectedIndex == index
                                ? Colors.white
                                : AppColors.selectCategoryDefalutColor,
                            BlendMode.srcIn),
                      ),
                    )),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  icons.label,
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _selectedIndex == index
                          ? AppColors.selectedColor
                          : AppColors.buttonBarColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
