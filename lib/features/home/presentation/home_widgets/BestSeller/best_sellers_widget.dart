import 'package:flutter/material.dart';
import '../../../../../common/themes/app_colors.dart';
import 'best_seller_phone.dart';

class BestSellersWidget extends StatelessWidget {
  const BestSellersWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Text(
                'Best Seller',
                style: TextStyle(
                    fontFamily: 'MarkProbold',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: AppColors.buttonBarColor),
              ),
            ),
            SizedBox(
              width: 167,
            ),
            Text(
              'see more',
              style: TextStyle(
                  fontFamily: 'MarkPronormal400',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.selectedColor),
            ),
          ],
        ),
        BestSellerPhoneWidget()
      ],
    );
  }
}
