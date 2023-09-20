import 'package:ecommerce_project/features/home/presentation/home_widgets/SelectCategory/select_category_icons_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../common/themes/app_colors.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Text(
                'Select Category',
                style: TextStyle(
                    fontFamily: 'MarkProbold',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: AppColors.buttonBarColor),
              ),
            ),
            SizedBox(
              width: 113,
            ),
            Text(
              'view all',
              style: TextStyle(
                  fontFamily: 'MarkPronormal400',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.selectedColor),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        SelectCategoryIconsWidget()
      ],
    );
  }
}
