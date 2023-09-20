import 'package:flutter/material.dart';
import '../../../../../common/themes/app_colors.dart';
import 'hot_sales_picture_widget.dart';

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
         Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Text(
                'Hot Sales',
                style: TextStyle(
                    fontFamily: 'MarkProbold',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: AppColors.buttonBarColor),
              ),
            ),
            SizedBox(
              width: 180,
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
        SizedBox(
          height: 8,
        ),
        HotSalesPictureWidget(),
      ],
    );
  }
}
