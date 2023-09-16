import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/filer_options.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:ecommerce_project/common/svg_icons.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32),
          child: SizedBox(
            width: 300,
            height: 34,
            child: TextField(
              style: TextStyle(fontSize: 13),
              cursorHeight: 13,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(1, 0, 53, 0.5),
                      fontFamily: 'MarkPronormal400',
                      fontWeight: FontWeight.w500),
                  isCollapsed: true,
                  prefixIcon: Image.asset(
                    'assets/search.png',
                    color: AppColors.selectedColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  prefixStyle: const TextStyle(fontSize: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  isDismissible: false,
                  enableDrag: false,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: Colors.transparent),
                        child: FilterOptions());
                  });
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: AppColors.selectedColor),
            child: filterOptionsIcon)
      ],
    );
  }
}
