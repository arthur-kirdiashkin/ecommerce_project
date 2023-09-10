import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:ecommerce_project/common/svg_icons.dart';
import 'package:flutter/material.dart';

class HomeLocationWidget extends StatelessWidget {
  const HomeLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 105),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          locationIcon,
          SizedBox(
            width: 11,
          ),
          Text(
            'Zihuatanejo, Gro',
            style: TextStyle(
              fontFamily: 'MarkPronormal500',
                fontWeight: FontWeight.w800,
                color: AppColors.buttonBarColor),
          ),
          SizedBox(
            width: 8,
          ),
          geoPositionIcon,
          SizedBox(
            width: 80,
          ),
          filterIcon
        ],
      ),
    );
  }
}
