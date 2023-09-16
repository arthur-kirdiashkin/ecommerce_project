import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 375,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 18),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(27, 27),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: AppColors.buttonBarColor),
                ),
                Text(
                  'Filter Options',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.buttonBarColor),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontFamily: 'MarkPronormal500',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 37),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.selectedColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brand',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                    height: 37,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: FilterBrandWidget(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromRGBO(220, 220, 220, 1)))),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Price',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                  SizedBox(
                  height: 7,
                ),
                Container(
                    height: 37,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: FilterPriceWidget(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromRGBO(220, 220, 220, 1)))),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Size',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                  SizedBox(
                  height: 7,
                ),
                Container(
                    height: 37,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: FilterSizeWidget(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromRGBO(220, 220, 220, 1)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBrandWidget extends StatefulWidget {
  const FilterBrandWidget({super.key});

  @override
  State<FilterBrandWidget> createState() => _FilterBrandWidgetState();
}

class _FilterBrandWidgetState extends State<FilterBrandWidget> {
  String brandValue = 'Samsung';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: SizedBox.shrink(),
      isExpanded: true,
      dropdownColor: Colors.white,
      value: brandValue,
      icon: Icon(Icons.keyboard_arrow_down, size: 30, color: AppColors.arrowSizeColor,),
      elevation: 16,
      onChanged: (String? neWvalue) {
        setState(() {
          brandValue = neWvalue!;
        });
      },
      items: <String>[
        'Samsung',
        'Xiaomi',
        'Huawei',
        'Motorola',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  color: AppColors.buttonBarColor,
                  fontFamily: 'MarkPronormal400',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          );
        },
      ).toList(),
    );
  }
}

class FilterPriceWidget extends StatefulWidget {
  const FilterPriceWidget({super.key});

  @override
  State<FilterPriceWidget> createState() => _FilterPriceWidgetState();
}

class _FilterPriceWidgetState extends State<FilterPriceWidget> {
  String brandValue = '\$300 - \$500';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        dropdownColor: Colors.white,
        value: brandValue,
        icon: Icon(Icons.keyboard_arrow_down, size: 30, color: AppColors.arrowSizeColor,),
        elevation: 16,
        onChanged: (String? neWvalue) {
          setState(() {
            brandValue = neWvalue!;
          });
        },
        items: <String>[
          '\$300 - \$500',
          '\$500 - \$800',
          '\$800 - \$1100',
          '\$1100 - \$1500',
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    color: AppColors.buttonBarColor,
                    fontFamily: 'MarkPronormal400',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            );
          },
        ).toList());
  }
}


class FilterSizeWidget extends StatefulWidget {
  const FilterSizeWidget({super.key});

  @override
  State<FilterSizeWidget> createState() => _FilterSizeWidgetState();
}

class _FilterSizeWidgetState extends State<FilterSizeWidget> {
  String brandValue = '4.5 to 5.5 inches';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        dropdownColor: Colors.white,
        value: brandValue,
        icon: Icon(Icons.keyboard_arrow_down, size: 30, color: AppColors.arrowSizeColor,),
        elevation: 16,
        onChanged: (String? neWvalue) {
          setState(() {
            brandValue = neWvalue!;
          });
        },
        items: <String>[
          '4.5 to 5.5 inches',
          '5.5 to 6.5 inches',
          '6.5 to 7.5 inches',
          '7.5 to 8.5 inches',
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    color: AppColors.buttonBarColor,
                    fontFamily: 'MarkPronormal400',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            );
          },
        ).toList());
  }
}