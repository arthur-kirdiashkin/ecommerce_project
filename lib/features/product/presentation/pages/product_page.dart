import 'package:flutter/material.dart';
import '../../../../common/svg_icons.dart';
import '../../../../common/themes/app_colors.dart';
import '../product_widgets/ProductCharacteristics/product_characteristics_widget.dart';
import '../product_widgets/ProductDetails/product_details_phone_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        minimumSize: const Size(37, 37),
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
                        minimumSize: const Size(37, 37),
                        backgroundColor: AppColors.selectedColor,
                        padding: const EdgeInsets.all(10),
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
            const ProductDetailsPhoneWidget(),
            const ProductCharacteristicsWidget(),
          ],
        ),
      ),
    );
  }
}
