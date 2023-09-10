import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_characteristics_widget.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_details_phone_widget.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/svg_icons.dart';


class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(37, 37),
                    backgroundColor: AppColors.buttonBarColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: productArrowIcon,
              ),
            ),
            const Text(
              'Product Details',
              style: TextStyle(
                  fontFamily: 'MarkPronormal500',
                  color: AppColors.buttonBarColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(37, 37),
                    backgroundColor: AppColors.selectedColor,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: productBasketIcon,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ProductDetailsPhoneWidget(),
        ProductCharacteristicsWidget()
        // Consumer<ProductModelInherited>(
        //   builder: (BuildContext context, productModelInherited, _) {
        //     context.read<ProductModelInherited>().loadProduct();
        //     return const ProductDetailsPhoneWidget();
        //   },
        // ),
        // Consumer<ProductModelInherited>(
        //   builder: (BuildContext context, productModelInherited, _) {
        //     context.read<ProductModelInherited>().loadProduct();
        //     return const ProductCharacteristicsWidget();
        //   },
        // ),
      ],
    );
  }
}
