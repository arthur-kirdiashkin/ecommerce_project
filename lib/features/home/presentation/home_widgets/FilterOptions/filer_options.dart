import 'package:flutter/material.dart';

import '../../../../../common/themes/app_colors.dart';

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
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(27, 27),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: AppColors.buttonBarColor),
                  child: const Icon(Icons.close, size: 18),
                ),
                const Text(
                  'Filter Options',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.buttonBarColor),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 37),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.selectedColor),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        fontFamily: 'MarkPronormal500',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Brand',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 37,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromRGBO(220, 220, 220, 1)),
                  ),
                  child: const FilterBrandWidget(),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Price',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                    height: 37,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: const Color.fromRGBO(220, 220, 220, 1))),
                    child: const FilterPriceWidget()),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Size',
                  style: TextStyle(
                      fontFamily: 'MarkPronormal500',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonBarColor),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 37,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                  ),
                  child: const FilterSizeWidget(),
                ),
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
      underline: const SizedBox.shrink(),
      isExpanded: true,
      dropdownColor: Colors.white,
      value: brandValue,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
        color: AppColors.arrowSizeColor,
      ),
      elevation: 16,
      onChanged: (String? neWvalue) {
        setState(
          () {
            brandValue = neWvalue!;
          },
        );
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
              style: const TextStyle(
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
        underline: const SizedBox.shrink(),
        isExpanded: true,
        dropdownColor: Colors.white,
        value: brandValue,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 30,
          color: AppColors.arrowSizeColor,
        ),
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
                style: const TextStyle(
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
        underline: const SizedBox.shrink(),
        isExpanded: true,
        dropdownColor: Colors.white,
        value: brandValue,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 30,
          color: AppColors.arrowSizeColor,
        ),
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
                style: const TextStyle(
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
