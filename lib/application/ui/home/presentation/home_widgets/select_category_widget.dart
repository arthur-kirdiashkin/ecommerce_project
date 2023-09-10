import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/select_category_icons_widget.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text('Select Category', style: TextStyle(
                  fontFamily: 'MarkProbold',
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: AppColors.buttonBarColor
                ),),
              ),
              SizedBox(
                width: 113,
              ),
              Text('view all', style: TextStyle(
                fontFamily: 'MarkPronormal400',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.selectedColor
              ),),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        SelectCategoryIconsWidget()
      ],
    );
  }
}