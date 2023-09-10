import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/best_seller_example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/app_colors.dart';

class BestSellerWidget extends StatefulWidget {
  const BestSellerWidget({super.key});

  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        // Consumer<BestSellerModelInherited>(
        //   builder: (context, bestSellerModelInherited, _) {
        //     final bestSellersOne = context.read<BestSellerModelInherited>().loadBestSellers();
        //     return const BestSellerProvierWidget();
        //   },
          
        // ),
        BestSellerProvierWidget()
      ],
    );
  }
}
