import 'package:ecommerce_project/common/svg_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../common/themes/app_colors.dart';

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
          const SizedBox(
            width: 11,
          ),
          const Text(
            'Zihuatanejo, Gro',
            style: TextStyle(
                fontFamily: 'MarkPronormal500',
                fontWeight: FontWeight.w800,
                color: AppColors.buttonBarColor),
          ),
          const SizedBox(
            width: 8,
          ),
          geoPositionIcon,
          const SizedBox(
            width: 80,
          ),
          filterIcon
        ],
      ),
    );
  }
}
