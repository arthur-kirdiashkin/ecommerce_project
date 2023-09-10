import 'package:ecommerce_project/application/ui/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_details_phone_widget.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../common/svg_icons.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class SelectPropertiesWidget extends StatefulWidget {
  const SelectPropertiesWidget({super.key});

  @override
  State<SelectPropertiesWidget> createState() => _SelectPropertiesWidgetState();
}

class _SelectPropertiesWidgetState extends State<SelectPropertiesWidget> {
  bool? isSelected;
  int tapIndexOne = 1;
  int tapIndexTwo = 0;
  int tapColorOne = 1;
  int tapColorTwo = 0;

  @override
  Widget build(BuildContext context) {
    // final productModelInherited = context.watch<ProductModelInherited>();
    // final colors = productModelInherited.productsList[0].color;

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        if (state is ProductLoadedState) {
          products = state.product;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Select color and capacity',
                  style: TextStyle(
                    fontFamily: 'MarkPronormal500',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.buttonBarColor,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor:
                              HexColor.fromHex(products[0].color[0]),
                          shape: CircleBorder()),
                      onPressed: () {
                        setState(() {
                          tapIndexOne = 1;
                          tapIndexTwo = 0;
                        });
                      },
                      child: tapIndexOne == 1 && tapIndexTwo == 0
                          ? vectorIcon
                          : null,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: HexColor.fromHex(products[0].color[1]),
                        shape: CircleBorder()),
                    onPressed: () {
                      setState(() {
                        tapIndexTwo = 1;
                        tapIndexOne = 0;
                      });
                    },
                    child: tapIndexTwo == 1 && tapIndexOne == 0
                        ? vectorIcon
                        : null,
                  ),
                  SizedBox(
                    width: 58,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(71, 20),
                        padding: EdgeInsets.all(12),
                        backgroundColor: tapColorOne == 1 && tapColorTwo == 0
                            ? AppColors.selectedColor
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        tapColorOne = 1;
                        tapColorTwo = 0;
                      });
                    },
                    child: Text(
                      '${products[0].capacity[0]} GB',
                      style: TextStyle(
                          color: tapColorOne == 1 && tapColorTwo == 0
                              ? Colors.white
                              : Colors.grey,
                          fontFamily: 'MarkPronormal700',
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: tapColorOne == 0 && tapColorTwo == 1
                            ? AppColors.selectedColor
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        tapColorOne = 0;
                        tapColorTwo = 1;
                      });
                    },
                    child: Text(
                      '${products[0].capacity[1]} GB',
                      style: TextStyle(
                          color: tapColorOne == 0 && tapColorTwo == 1
                              ? Colors.white
                              : Colors.grey,
                          fontFamily: 'MarkPronormal700',
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cartpage())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontFamily: 'MarkPronormal700',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '\$${products[0].price}.00',
                    style: TextStyle(
                        fontFamily: 'MarkPronormal700',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 29, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColors.selectedColor,
                  ),
                ),
              )
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
