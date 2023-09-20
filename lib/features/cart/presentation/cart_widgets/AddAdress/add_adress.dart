import 'package:flutter/material.dart';
import '../../../../../common/svg_icons.dart';
import '../../../../../common/themes/app_colors.dart';

class AddAdressWidget extends StatelessWidget {
  const AddAdressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Padding(
          padding: EdgeInsets.only(top: 5, left: 140),
          child: Text(
            'Add address',
            style: TextStyle(
                fontFamily: 'MarkPronormal500',
                color: AppColors.buttonBarColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
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
            child: vectorAddressIcon,
          ),
        )
      ],
    );
  }
}